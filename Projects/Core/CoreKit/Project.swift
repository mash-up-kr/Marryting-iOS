import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
  name: "CoreKit",
  targets: [
    Target(
      name: "CoreKit",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.CoreKit",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: []
    ),
    Target(
      name: "CoreKitTests",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.CoreKitTests",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [.target(name: "CoreKit")]
    ),
    Target(
      name: "NetworkProtocol",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.NetworkProtocol",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["../NetworkProtocol/Sources/**"],
      dependencies: []
    ),
    Target(
      name: "Network",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.Network",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["../Network/Sources/**"],
      dependencies: [.target(name: "NetworkProtocol")]
    ),
    Target(
      name: "Models",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.Models",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["../Models/Sources/**"],
      dependencies: []
    ),
  ]
)
