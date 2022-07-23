import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
  name: "ProfileRegister",
  targets: [
    Target(
      name: "ProfileRegister",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.ProfileRegister",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        .project(target: "DesignSystem", path: "../../DesignSystem"),
        .project(target: "Models", path: "../../Core/CoreKit"),
        .project(target: "DataSource", path: "../../DataSource"),
        .external(name: "SnapKit"),
        .external(name: "Kingfisher"),
      ]
    ),
    Target(
      name: "ProfileRegisterTests",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.ProfileRegisterTests",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [.target(name: "ProfileRegister")]
    ),
  ]
)
