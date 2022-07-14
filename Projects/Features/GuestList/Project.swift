import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
  name: "GuestList",
  targets: [
    Target(
      name: "GuestList",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.GuestList",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        .project(target: "DesignSystem", path: "../../DesignSystem"),
        .project(target: "Models", path: "../../Core/CoreKit")
      ]
    ),
    Target(
      name: "GuestListTests",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.GuestListTests",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [.target(name: "GuestList")]
    ),
  ]
)
