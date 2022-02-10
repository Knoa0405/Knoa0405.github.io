---
layout: post
title:  "prototype"
date:   2022-02-05 21:03:36 +0530
categories: Javascript
---
프로토타입이 무엇인지 궁금했습니다. 언뜻 알고 있던 개념을 재정립해봤습니다.

```javascript
const array = [1,2,3];
const array2 = new Array();

Array.prototype.test1 = 'hello';

console.log([1,2,3].test1); // hello
```

프로토 타입은 자바스크립트 상속에 사용된다. Array 객체에는 여러가지 메서드와 속성이 존재한다.  
해당 객체의 인스턴스는 객체의 메서드와 속성들을 상속한다.  
이때, 프로토타입이라는 "유전자" 가 사용된다.  
우리는 위에서 Array 내부 유전자를 변경했다. 따라서 test1 = 'hello' 라는 속성이 들어간다.
해당 객체의 인스턴스는 해당 속성을 사용할 수 있게 된다.  
따라서 마지막에 hello 라는 문자열이 출력되는 것이다.