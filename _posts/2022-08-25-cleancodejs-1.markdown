---
layout: post
title:  "Clean code with JS - 1"
categories: Javascript
---
Clean Code Js - 1

```javascript
  // 문법 오류 발생
  const obj = {id: if (condition) { 'msg' }}
  // 삼항 연산자는 값으로 귀결될 수 있는 식이기 때문에 사용 가능
  const obj = {
    id: condition ? 'msg' : null
  }
  // IIFE
  <p>
    {(() => {
      switch(this.state.color) {
        case 'red' :
          return '#FF0000';
      }
    })()}
  </p>

  <tbody>
    {(() => {
      const rows = [];
      for(let i = 0; i < objectRows.length; i++) {
        rows.push(<Row key={i} data={obj} />)
      }
    })()}
  </tbody>

  <tbody>
    {rows.map((item, index) => {
      return <Row data={item} key={index}/>
    })}
  </tbody>
```

삼항 연산자 best practice

```javascript
  조건 ? 참 : 거짓
       (식)  (식)

  function example() {
    return condition1 ? value1
      : condition2 ? value2
      : condition3 ? value3
      : value4
  }
  // 위처럼 남발할거면 switch case 문을 사용하자

  // 조건이 헷갈릴 때는 괄호를 넣어주자
  const example = condition1
    ? (a === 0 ? 'zero' : 'positive')
    : 'negative';

  const message = (isLogin) => {
    const name = isLogin ? getName() : '이름 없음';

    return `안녕하세요 ${name}님`
  }

  // bad case = if / else 쓰는게 낫다.
  const alertMessage(isAdult) {
    isAdult
      ? alert('hello') // void 반환
      : alert('world') // void 반환
  }

  // 값을 만들고 변수로 반환하는 경우
```

조건 ? X : 거짓인 경우
조건 ? 참 : X 인 경우


## Early Return
```javascript
// bad case
function loginService(isLogin, user) {
  if(!isLogin) {
    if(!checkToken()) {
      if(!user.nickname) {
        return refreshToken();
      } else {
        refreshToken();
      }

      return '로그인 성공';
    }
  } else {
    throw new Error('No Token');
  }
}

// refactor
function login() {
  refreshToken();

  return '로그인 성공';
}

function loginService(isLogin, user) {
  // Early return
  if(isLogin) {
    return;
  }

  if(!checkToken()) {
    throw new Error('No Token');
  }

  if(!user.nickname) {
    return refreshToken();
  }

  login();
}

// bad case
function 오늘하루(condition, weather, isJob) {
  if(condition === 'GOOD') {
    공부();
    게임();
    유튜브보기();

    if(weather === 'GOOD') {
      운동();
      빨래();
    }

    if(isJob === 'GOOD') {
      야간업무();
      조기취침();
    }
  }
}

// refactor early return 무조건 많은게 좋은게 아님
function 오늘하루(condition, weather, isJob) {
  if(condition !== 'GOOD') {
    return;
  }

  공부();
  게임();
  유튜브보기();

  if(weather !== 'GOOD') {
    return;
  }

  운동();
  빨래();

  if(isJob === 'GOOD') {
    야간업무();
    조기취침();
  }
}

// 부정 조건문 => 지양하기

// 단점
// 1. 생각을 한번 더 해야한다.
// 2. 프로그래밍 언어 자체로 if 문이 처음부터 오고 true 부터 실행시킨다.
const inCondition = true;
const isNotCondition = false;

if(!isCondition) {
  console.log('거짓인 경우에만 실행');
}

if(isNotCondition) {
  console.log('거짓인 경우에만 실행');
}

// 부정 조건문 사용시
// 1. 유효성 검증, Early Return
// 2. 보안 혹은 검사하는 로직

```

```javascript

// default Case 고려하기
function sum(x, y) {
  return x + y;
}

sum(100,200);

function registerDay(userInputDay) {
  switch(userInputDay) {
    case '월요일':
    case '화요일':
    case '수요일':
    case '목요일':
    case '금요일':
    case '토요일':
    case '일요일':
  }
}
```

```javascript
let number;

function decrement(number) {
  // 불명시적
  number--;
  // 누가봐도 읽기 쉽게
  number = number - 1;
}

function increment(number) {
  // 불명시적
  number++;
  // 누가봐도 읽기 쉽게
  number = number + 1;
}

// 예측가능하고 디버깅하기 쉬운!
// 연산자 우선순위 (()) => 괄호 적극 사용

```

```javascript
  // Null 병합 연산자 (Null coalescing operator)

  // ?? => null 과 undefined 일 경우에만 사용! 뒤에 있는 default 사용
  
  null || undefined ?? "foo" // error
  // Logical expressions and coalesce expressions cannot be mixed
  (null || undefined) ?? "foo"
```

### 드모르간 법칙

```javascript
  const isValidUser = true;
  const isValidToken = true;

  if(!(isValidToken && isValidUser)) {
    console.log('로그인 실패!');
  }

  if(!isValidToken || !isValidUser) {

  }

  if(isValidUser || isValidToken) {

  }
```

### Array.isArray(arr) 사용

