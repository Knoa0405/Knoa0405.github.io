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