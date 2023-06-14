
<h1 align="center">👰‍♀️ 결혼식 소개팅 서비스, 메리팅 🤵</h1>
<h3 align="center">"결혼식은 너의 시작이자, 나의 시작이야"</h3>

<br />

<br />

<p align="center"> <img width="700" src="https://user-images.githubusercontent.com/56102421/191398162-2f600122-6394-4369-93c2-b61bb3107ef7.png"> </p>

## 기능 소개

- 영상은 로딩되는데 시간이 조금 걸리기에 [위키](https://github.com/mash-up-kr/Marryting-iOS/wiki)에서 확인할 수 있습니다. 🐢..🐢🐢..🐢🐢🐢..

### ✨ 프로필 설정

**설명**

<img width="600" alt="표지2" src="https://user-images.githubusercontent.com/56102421/191398486-8f5c37b8-bd3c-4532-95a5-9b173a265c1a.png"> 

### ✨ 좋아요 보내기

**설명**

<img width="600" alt="표지3" src="https://user-images.githubusercontent.com/56102421/191398437-2a8848c9-8dc6-4e57-b9a1-b8d2866851ba.png">

### ✨ 매칭 확인

**설명**

<img width="600" alt="표지4" src="https://user-images.githubusercontent.com/56102421/191398453-47a9d1f5-e7be-4b73-ab7f-88a9de9f7f51.png"> 

### ✨ 매칭 !

**사진 생략**

## Tuist Build 

1. Install tuist

   `bash <(curl -Ls https://install.tuist.io)`

2. Run Tuist dependencies - (Optional, install library)

   ```bash
   # lottie-ios에서 SPM에서 에러 발생하여, Carthage를 이용하여 lottie-ios를 빌드함.
   $ tuist dependencies fetch
   ```

3. Run tuist generate

   `tuist generate`

4. Open workspace

   `open App.xcworkspace`



## 🗂 Dependency Graph

Tuist를 이용하여 출력한 Depedency Graph

```bash
$ tuist graph # Graph 생성
$ tuist graph --format=png # Graph png 파일로 생성
```

![graph](https://user-images.githubusercontent.com/56102421/191402332-253b14f6-418f-413c-9ff7-e625e329335c.png)

### Reference

- https://github.com/minsOne/iOSApplicationTemplate
- https://github.com/tuist/tuist/issues/4636#issue-1317283293 

```
Projects
  |── Core
  │	└── CoreKit
  │		│── NetworkProtocol (Target)
  │		│── Network (Target) 
  │		└── Models (Target)
  │── DataSource
  │── DesignSystem 
  │── Features
  │	│── AuthCode
  │	│	│── AuthCodeRouter
  │	│	│── AuthCodeRoutingProtocol
  │	│	└── AuthCodeScene
  │	│── GuestList
  │	│── GuestDetail
  │	│── LikeRequest
  │	│── LikeRequestComplete
  │	│── Login
  │	│── MeetingList
  │	│── MyGuestList
  │	│── ProfileRegister
  │	│── ProfileRegisterComplete
  │	│── Splash
  └── Marryting
	└── AppDelegate.swift
```

### 외부 디펜던시

- [SnapKit](https://github.com/SnapKit/SnapKit)
- [Kingfisher](https://github.com/onevcat/Kingfisher)
- [Alamofire](https://github.com/Alamofire/Alamofire)
- [kakao-ios-sdk](https://github.com/kakao/kakao-ios-sdk)
- [lottie-ios](https://github.com/airbnb/lottie-ios)
- [TOCropViewController](https://github.com/TimOliver/TOCropViewController)


## Coding Convention

[StyleSharer Convention](https://github.com/StyleShare/swift-style-guide)

## [AppStore Link](https://apps.apple.com/kr/app/%EB%A9%94%EB%A6%AC%ED%8C%85/id1641033611)

<p align="center"><img width="600" alt="표지6" src="https://user-images.githubusercontent.com/56102421/191398444-c299fd04-9663-496b-ba6b-92f75d947a32.png"></p>

## Developer 👨‍👩‍👦

<table>
    <tr align="center">
        <td><B>박건우<B></td>
        <td><B>박유진<B></td>
        <td><B>이재용<B></td>
    </tr>
    <tr align="center">
        <td>
            <img src="https://github.com/gunoooo.png?size=120">
            <br>
            <a href="https://github.com/gunoooo"><I>gunoooo</I></a>
        </td>
        <td>
            <img src="https://github.com/p41155a.png?size=120">
            <br>
            <a href="https://github.com/p41155a"><I>p41155a</I></a>
        </td>
        <td>
            <img src="https://github.com/samsung-ga.png?size=120">
            <br>
            <a href="https://github.com/samsung-ga"><I>samsung-ga</I></a>
        </td>
    </tr>
</table>

