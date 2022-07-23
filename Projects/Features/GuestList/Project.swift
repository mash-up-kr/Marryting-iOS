import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
  name: "GuestList",
  targets: [
    Target(
      name: "GuestListRoutingProtocol",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.GuestListRoutingProtocol",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Targets/RoutingProtocol/**"],
      resources: [],
      dependencies: [
        .project(target: "Models", path: "../../Core/CoreKit")
      ]
    ),
    Target(
      name: "GuestListRouter",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.GuestListRouter",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Targets/Router/**"],
      resources: [],
      dependencies: [
        .target(name: "GuestListRoutingProtocol"),
        .project(target: "LikeRequestScene", path: "../LikeRequest"),
      ]
    ),
    Target(
      name: "CardSideManager",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.GuestList",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Targets/CardSideManager/**"],
      resources: [],
      dependencies: []
    ),
    Target(
      name: "GuestListScene",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.GuestListScene",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Targets/Scene/Sources/**"],
      resources: ["Targets/Scene/Resources/**"],
      dependencies: [
        .target(name: "GuestListRouter"),
        .target(name: "CardSideManager"),
        .project(target: "DesignSystem", path: "../../DesignSystem"),
        .project(target: "Models", path: "../../Core/CoreKit"),
        .project(target: "DataSource", path: "../../DataSource"),
        .external(name: "SnapKit"),
        .external(name: "Kingfisher")
      ]
    ),
    Target(
      name: "GuestListSceneTests",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.GuestListTests",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Targets/Scene/Tests/**"],
      dependencies: [.target(name: "GuestListScene")]
    ),
  ]
)
