import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
  name: "Login",
  targets: [
    Target(
      name: "Login",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.Login",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        .project(target: "DesignSystem", path: "../../DesignSystem"),
        .project(target: "Models", path: "../../Core/CoreKit"),
        .project(target: "DataSource", path: "../../DataSource"),
        .external(name: "SnapKit"),
        .external(name: "Kingfisher")
      ]
    ),
    Target(
      name: "LoginTests",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.LoginTests",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [.target(name: "Login")]
    ),
  ]
)
