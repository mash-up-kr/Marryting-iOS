import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
  name: "Login",
  targets: [
    Target(
      name: "LoginRoutingProtocol",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.LoginRoutingProtocol",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Targets/RoutingProtocol/**"],
      resources: [],
      dependencies: [
        .project(target: "Models", path: "../../Core/CoreKit")
      ]
    ),
    Target(
      name: "LoginRouter",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.LoginRouter",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Targets/Router/**"],
      resources: [],
      dependencies: [
        .target(name: "LoginRoutingProtocol"),
        .project(target: "ProfileRegister", path: "../ProfileRegister"),
        .project(target: "GuestListScene", path: "../GuestList"),
        .project(target: "MeetingListScene", path: "../MeetingList"),
        .external(name: "KakaoSDKUser"),
        .external(name: "KakaoSDKAuth"),
        .external(name: "KakaoSDKCommon")
      ]
    ),
    Target(
      name: "LoginScene",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.LoginScene",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Targets/Scene/Sources/**"],
      resources: ["Targets/Scene/Resources/**"],
      dependencies: [
        .target(name: "LoginRouter"),
        .project(target: "DesignSystem", path: "../../DesignSystem"),
        .project(target: "Models", path: "../../Core/CoreKit"),
        .project(target: "DataSource", path: "../../DataSource"),
        .external(name: "SnapKit"),
        .external(name: "Kingfisher")
      ]
    ),
    Target(
      name: "LoginSceneTests",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.LoginTests",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Targets/Scene/Tests/**"],
      dependencies: [.target(name: "LoginScene")]
    ),
  ]
)
