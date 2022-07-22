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
        .project(target: "MyGuestListScene", path: "../MyGuestList"),
        .project(target: "GuestDetailScene", path: "../GuestDetail")
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
