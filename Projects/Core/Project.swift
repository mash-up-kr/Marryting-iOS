import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
  name: "Core",
  targets: [
    Target(
      name: "Core",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.Core",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: []
    ),
    Target(
      name: "CoreTests",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.CoreTests",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [.target(name: "Core")]
    ),
  ]
)
