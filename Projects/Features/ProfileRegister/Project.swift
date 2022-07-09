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
      dependencies: []
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
