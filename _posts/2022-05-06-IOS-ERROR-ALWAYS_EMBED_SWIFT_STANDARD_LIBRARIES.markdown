---
layout: post
title:  "IOS-WARNING-ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES"
categories: Javascript
---
```shell
The `poomang [Debug]` target overrides the `ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES` build setting defined in `Pods/Target Support Files/Pods-poomang/Pods-poomang.debug.xcconfig'. This can lead to problems with the CocoaPods installation
```
pod install 과정에서 위와 같은 warning 이 발생했다.  
해결 방법은 아래와 같다.  
1. xcode 에서 해당 프로젝트를 연다.
2. Targets 에서 해당 타겟을 연다.
3. Build Setting 에서 filters 를 통해 Always Embed Swift Standard Libraries 를 검색한다.
4. 설정된 부분에서 YES / NO / Other 중 Other 를 클릭하고 인풋에 $(inherited) 넣어준다.