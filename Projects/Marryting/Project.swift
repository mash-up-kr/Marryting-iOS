import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let infoPlist: [String: InfoPlist.Value] = [
  "CFBundleDevelopmentRegion": "ko_KR",
  "CFBundleShortVersionString": "1.0.2",
  "CFBundleVersion": "1",
  "CFBundleDisplayName": "메리팅",
  "UIMainStoryboardFile": "",
  "UILaunchStoryboardName": "LaunchScreen",
  "NSAppTransportSecurity": ["NSAllowsArbitraryLoads": true],
  "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"],
  "NSCameraUsageDescription": "프로필 사진 등록을 위해 카메라 접근 권한이 필요합니다",
  "NSPhotoLibraryUsageDescription": "프로필 사진 등록을 위해 카메라 접근 권한이 필요합니다",
  "NSPhotoLibraryAddUsageDescription": "프로필 사진 등록을 위해 카메라 접근 권한이 필요합니다",
  "LSApplicationQueriesSchemes": ["kakaokompassauth","kakaolink"],
  "CFBundleURLTypes": [["CFBundleTypeRole": "Editor","CFBundleURLSchemes":["kakaobd614625345b00170f51b167c97e96e9"]]]
]

let project = Project.make(
  name: "Marryting",
  targets: [
    Target(
      name: "Marryting",
      platform: .iOS,
      product: .app,
      bundleId: "kr.mash-up.Marryting",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .extendingDefault(with: infoPlist),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        .project(target: "DesignSystem", path: "../DesignSystem"),
        .project(target: "DataSource", path: "../DataSource"),
        .project(target: "FeatureKit", path: "../Features/FeatureKit"),
        .project(target: "CoreKit", path: "../Core/CoreKit"),
        .external(name: "KakaoSDKAuth")
      ]
    ),
    Target(
      name: "MarrytingTests",
      platform: .iOS,
      product: .unitTests,
      bundleId: "kr.mash-up.MarrytingTests",
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [.target(name: "Marryting")]
    )
  ]
)
