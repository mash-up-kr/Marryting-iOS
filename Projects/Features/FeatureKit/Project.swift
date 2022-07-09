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
      dependencies: []
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
