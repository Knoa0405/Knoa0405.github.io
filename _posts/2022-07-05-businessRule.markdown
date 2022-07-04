---
layout: post
title:  "business Rule"
categories: CSBasic
---
데이터 베이스와 비즈니스 룰의 관계

**비즈니스 룰에서 entity, attribute, relationship 찾기**

-> entity 는 명사 후보
-> attribute 는 하나의 값으로 표현 할 수 있는 후보
-> relationship 은 동사 후보

1. **유저**는 **상품**을 **주문**할 수 있다.
- USER <=> PRODUCT / ORDER ( RELATIONSHIP )
2. 동일한 **주문내역**은 한번의 배달로, 3일 안에 **유저**가 지정한 **배송지**에 전달돼야 한다. 만약 그렇지 못할 시, **유저**에게 최대한 빨리 알려줘야 한다.

USER <=> PRODUCT
    ORDER
    - destination

3. **유저**는 **상품**에 대한 **평가**를 줄 수 있다. **평가**는 두 종류의 데이터 : 1~5 사이의 자연수의 **별점**, 그리고 200자 이내 **줄 글**을 통해 할 수 있다.