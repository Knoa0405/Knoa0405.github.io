---
layout: post
title:  "after update window 11 android emulator issue"
categories: ReactNative
---
Window 11 업데이트 후 관련 안드로이드 에뮬레이터 이슈

### 안드로이드 에뮬레이터 왜 안돌아가지?

윈도우 11을 업데이트 한지 한달이 지났다. 맥으로 작업 하던 프로젝트를 
메인 노트북에서 하고 싶어져서 안드로이드 빌드를 해봤다. 
갑자기 안드로이드 에뮬레이터가 10분이 지나도 로딩을 하지 못했다. 
뭔가 이상함을 감지하고 android studio 에서 virtual device manager 에서 
virtual emulator reinstall 을 진행했다. 이후 다시 빌드를 해봤지만... 
결과는 같은 증상이 반복되었다. 뭔가 심각함을 인지하고 구글링을 시작했다.  
### "android studio emulator not working in window 11"  
검색하니 상단에 윈도우 11 업데이트 이후 에뮬레이터 문제가 생겼다는 글이 보였다.  
stackoverflow 글을 읽다보니 window 11 로 업데이트 해서만 문제가 발생하는 것이 아니라 
내가 예전에 window 에서 wsl2 를 사용하려고 설정해줬던 것들과 맞물려서 이슈가 발생한 것이었다. 발생 원인을 구체적으로 알지 못하지만, 안드로이드가 리눅스 기반이기 때문에 에뮬레이터를 돌릴 때도 
가상머신 구조상 하이퍼바이저를 통해 시스템 자원을 공유하기 때문에 운영체제 업데이트로 인한 이슈가 
생길 수도 있겠다는 생각이 들었다.
<div style="display : flex; flex-direction : column; align-items : center;">
    <img src="/assets/android_emulator.png" width="40%"/>
    <span>그림 1. 안드로이드 에뮬레이터 구조</span>
</div>

### 해결
- 문제는 간단했다. 2021년 11월 11일 31.2~ 버전 이후의 에뮬레이터 이슈를 해결해 릴리스 되었다.
- 안드로이드 스튜디오에서 sdk manger 를 통해 에뮬레이터 업데이트를 진행했다.