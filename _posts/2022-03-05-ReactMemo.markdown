---
layout: post
title:  "React Memo"
categories: React
---
리액트 Memo 에 대해 알아본다.

리액트 훅 중에는 useMemo 가 있고, memo 라는 메서드가 있다.  
이게 왜 있을까?  
- React 는 가상DOM 을 사용하기 때문에, native DOM 으로 반영하기 전에 상태를 비교해서
리렌더링을 해주는데 이때, React.memo() 를 감싸게 되면 감싸여진 컴포넌트의 렌더링 결과물을 메모리에 기억하고 있으므로 (memoize) 불필요한 렌더링을 건너뛴다.

DOM 을 업데이트 하기로 결정했다.