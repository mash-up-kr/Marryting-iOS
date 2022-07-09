import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
  name: "DesignSystem",
  targets: [
    Target(
      name: "DesignSystem",
      platform: .iOS,
      product: .framework,
      bundleId: "kr.mash-up.DesignSystem",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: []
    ),
    Target(
      name: "DesignSystemTests",
      platform: .iOS,
      product: .framework,
      bundleId: "kr.mash-up.DesignSystemTests",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [.target(name: "DesignSystem")]
    ),
  ]
)
