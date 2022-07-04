---
layout: post
title:  "Refactoring - 2"
categories: Javascript
---
리팩터링 2판을 보고 간단하게 정리해본다.

```javascript

function statement(invoice, plays) {
    let totalAmount = 0;
    let volumeCredits = 0;

    let result = `청구내역 : (고객명 : ${invoice.customer})\n`;
    const format = new Intl.NumberFormat("en-US", {
        style : "currency", currency : "USD",
        minimumFractionDigits : 2 }).format;

    for(let perf of invoice.performances) {
        const play = plays[perf.playID];
        let thisAmount = 0;


        switch(play.type) {
        case "tragedy" :
            thisAmount = 4000;

            if(perf.audience > 30) {
                thisAmount += 1000 * (perf.audience - 30);
            }

            break;
        case "comedy" :
            thisAmount = 3000;

            if(perf.audience > 20) {
                thisAmount += 10000 + 500 * (perf.audience - 20);
            }
            
            thisAmount += 300 * perf.audience;

            break;
        default:
            throw new Error(`알수 없는 장르 : ${play.type}`);
        }

        volumeCredits += Math.max(perf.audience - 30, 0);
        if("comedy" === play.type) volumeCredits += Math.floor(perf.audience / 5);

        result += ` ${play.name}: ${format(thisAmount/100)} (${perf.audience}석)`;
        totalAmount += thisAmount;
    }

    result += `총액 : ${format(totalAmount/100)}`;
    result += `정립 포인트 : ${volumeCredits}점`;

    return result;
}

```

## 테스트 코드를 만들자 ( 반드시! )
- 디버깅 역할을 해준다.
- 아무리 간단한 수정이라도 리팩터링 후에는 항상 테스트하는 습관을 들이는 것은 바람직하다.
- 리팩터링은 프로그램 수정을 작은 단계로 나눠 진행한다. 그래서 중간에 실수하더라도 버그를 쉽게 찾을 수 있다.

