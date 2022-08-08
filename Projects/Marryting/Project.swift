import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let infoPlist: [String: InfoPlist.Value] = [
  "CFBundleShortVersionString": "1.0",
  "CFBundleVersion": "1",
  "UIMainStoryboardFile": "",
  "UILaunchStoryboardName": "LaunchScreen",
  "NSAppTransportSecurity": ["NSAllowsArbitraryLoads": true],
  "UISupportedInterfaceOrientations": ["UIInterfaceOrientationPortrait"]
]

let project = Project.make(
  name: "Marryting",
  targets: [
    Target(
      name: "Marryting",
      platform: .iOS,
      product: .app,
      bundleId: "kr.mash-up.Marryting",
      infoPlist: .extendingDefault(with: infoPlist),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        .project(target: "DesignSystem", path: "../DesignSystem"),
        .project(target: "DataSource", path: "../DataSource"),
        .project(target: "FeatureKit", path: "../Features/FeatureKit"),
        .project(target: "CoreKit", path: "../Core/CoreKit")
      ]
    ),
    Target(
      name: "MarrytingTests",
      platform: .iOS,
      product: .unitTests,
      bundleId: "kr.mash-up.MarrytingTests",
      infoPlist: .default,
      sources: ["Tests/**"],
      dependencies: [.target(name: "Marryting")]
    )
  ]
)
