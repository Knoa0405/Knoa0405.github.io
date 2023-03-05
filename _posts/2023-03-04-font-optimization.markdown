---
layout: post
title: "font-optimization"
categories: Web Optimization
---
폰트 최적화

폰트 포맷에는 종류가 있다.
- TTF/OTF
- WOFF
- WOFF2
- EOT
- SVG

WOFF2 포맷을 사용해 폰트 사이즈를 줄인다.
```css
@font-face {
  font-family: FONT_NAME;
  src: local('FONT_NAME'),
       url('./assets/fonts/FONT_NAME.woff2') format('woff2'),
       url('./assets/fonts/FONT_NAME.woff') format('woff'),
       url('./assets/fonts/FONT_NAME.ttf') format('truetype');
  font-display: block;
}
```
subset ?
