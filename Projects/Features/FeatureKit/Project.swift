import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
  name: "FeatureKit",
  targets: [
    Target(
      name: "FeatureKit",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.FeatureKit",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        .project(target: "ProfileRegister", path: "../ProfileRegister"),
        .project(target: "GuestListScene", path: "../GuestList"),
        .project(target: "LikeRequestScene", path: "../LikeRequest"),
        .project(target: "LoginScene", path: "../Login"),
        .project(target: "LikeRequestCompleteScene", path: "../LikeRequestComplete"),
        .project(target: "GuestDetailScene", path: "../GuestDetail"),
        .project(target: "MyGuestListScene", path: "../MyGuestList"),
        .project(target: "MeetingListScene", path: "../MeetingList"),
        .project(target: "ProfileRegisterCompleteScene", path: "../ProfileRegisterComplete"),
        .project(target: "SplashScene", path: "../Splash"),
      ]
    ),
    Target(
      name: "FeatureKitTests",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.FeatureKitTests",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [.target(name: "FeatureKit")]
    ),
  ]
)
