import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
  name: "DataSource",
  targets: [
    Target(
      name: "DataSource",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.DataSource",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Sources/**"],
      resources: [],
      dependencies: [
        .project(target: "NetworkProtocol", path: "../Core/CoreKit"),
        .project(target: "Network", path: "../Core/CoreKit"),
        .project(target: "Models", path: "../Core/CoreKit"),
        .external(name: "Alamofire")
      ]
    ),
    Target(
      name: "DataSourceTests",
      platform: .iOS,
      product: .staticLibrary,
      bundleId: "kr.mash-up.DataSourceTests",
      deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [.target(name: "DataSource")]
    ),
  ]
)
