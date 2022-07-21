import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
  name: "LikeRequest",
  targets: [
    Target(
      name: "LikeRequestRoutingProtocol",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.LikeRequestRoutingProtocol",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Targets/RoutingProtocol/**"],
      resources: [],
      dependencies: [
        .project(target: "Models", path: "../../Core/CoreKit")
      ]
    ),
    Target(
      name: "LikeRequestRouter",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.LikeRequestRouter",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Targets/Router/**"],
      resources: [],
      dependencies: [
        .target(name: "LikeRequestRoutingProtocol")
      ]
    ),
    Target(
      name: "LikeRequestScene",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.LikeRequestScene",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Targets/Scene/Sources/**"],
      resources: ["Targets/Scene/Resources/**"],
      dependencies: [
        .target(name: "LikeRequestRouter"),
        .project(target: "LikeRequestCompleteScene", path: "../LikeRequestComplete"),
        .project(target: "DesignSystem", path: "../../DesignSystem"),
        .project(target: "Models", path: "../../Core/CoreKit"),
        .project(target: "DataSource", path: "../../DataSource"),
        .external(name: "SnapKit"),
        .external(name: "Kingfisher")
      ]
    ),
    Target(
      name: "LikeRequestSceneTests",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.LikeRequestSceneTests",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Targets/Scene/Tests/**"],
      dependencies: [.target(name: "LikeRequestScene")]
    ),
  ]
)
