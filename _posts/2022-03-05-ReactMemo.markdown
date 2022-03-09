---
layout: post
title:  "React Memo"
categories: React
---
복습 차원에서 React Memo 에 대해 알아본다.

리액트에는 memo 라는 메서드가 있다.
React.memo 는 HOC(고차 컴포넌트) 다.
### 이게 왜 있을까?
- React 는 가상DOM 을 사용하기 때문에, native DOM 으로 반영하기 전에 deps 에 포함된 이전 속성(props)과 변경된 속성을 비교해서
리렌더링을 해주는데 이때, React.memo() 를 감싸게 되면 감싸여진 컴포넌트의 렌더링 결과물을 메모리에 기억(memoize)하고 있으므로 불필요한 렌더링(Render tree 생성)을 건너뛴다.

- 기본적으로 얕은 비교를 한다. 1 on 1 prop 비교 등 커스텀한 비교도 가능하다.
```javascript
// facebook - react 구현 코드 일부

// true - 같다 ( 리렌더링 X )
// false - 다르다 ( 리렌더링 O )
function shallowEqual(objA: mixed, objB: mixed): boolean {
  if (is(objA, objB)) {
    return true;
  }

  if (
    typeof objA !== 'object' ||
    objA === null ||
    typeof objB !== 'object' ||
    objB === null
  ) {
    return false;
  }

  const keysA = Object.keys(objA);
  const keysB = Object.keys(objB);

  if (keysA.length !== keysB.length) {
    return false;
  }

  // Test for A's keys different from B.
  for (let i = 0; i < keysA.length; i++) {
    if (
      !hasOwnProperty.call(objB, keysA[i]) ||
      !is(objA[keysA[i]], objB[keysA[i]])
    ) {
      return false;
    }
  }

  return true;
}

export default shallowEqual;
```
### 어떻게 쓰면 좋을까?
- 동일한 props 라도 부모에서 콜백 함수를 넘겨 받는 경우에 useCallback ( 함수 재선언 방지 = 동일 인스턴스(참조값) ) hook 을 적용하지 않으면, 새로운 콜백 함수 인스턴스를 생성해 넘겨 주기 때문에 ( js 특, 함수 = 객체 )
리렌더링이 발생한다. 효과적인 [메모이제이션](https://en.wikipedia.org/wiki/Memoization)을 위해서 콜백 함수 관리가 필요하다. 
( 인라인 스타일과 비슷? style object 를 매번 새로운 object로 인식 -> 리렌더링 발생 )

### React.memo !== useMemo
- useMemo 는 메모이제이션된 값을 반환하는 hook 이다.
- computeExpensiveValue 에 적용하면 성능상 이점이 뚜렷해진다!
- deps 필수! 없으면 쓸 필요 없음.
```javascript
// useMemo 구현 일부
function useMemo<T>(nextCreate: () => T, deps: Array<mixed> | void | null): T {
  currentlyRenderingComponent = resolveCurrentlyRenderingComponent();
  workInProgressHook = createWorkInProgressHook();

  const nextDeps = deps === undefined ? null : deps;

  if (workInProgressHook !== null) {
    const prevState = workInProgressHook.memoizedState;
    if (prevState !== null) {
      if (nextDeps !== null) {
        const prevDeps = prevState[1];
        if (areHookInputsEqual(nextDeps, prevDeps)) {
          return prevState[0];
        }
      }
    }
  }
```
#### 기타 잡생각
- solid.js => 리액트처럼 memo 이런거 필요없음. https://www.solidjs.com/

인사이트 참고 - https://news.ycombinator.com/
