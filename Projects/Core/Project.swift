import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
  name: "Core",
  targets: [
    Target(
      name: "NetworkProtocol",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.NetworkProtocol",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["NetworkProtocol/Sources/**"],
      dependencies: []
    ),
    Target(
      name: "Network",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.Network",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Network/Sources/**"],
      dependencies: [.target(name: "NetworkProtocol")]
    ),
  ]
)
