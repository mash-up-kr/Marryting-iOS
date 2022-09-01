import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
    name: "AuthCode",
    targets: [
        Target(
            name: "AuthCodeRoutingProtocol",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.AuthCodeRoutingProtocol",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/RoutingProtocol/**"],
            resources: [],
            dependencies: []
        ),
        Target(
            name: "AuthCodeRouter",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.AuthCodeRouter",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Router/**"],
            resources: [],
            dependencies: [
                .target(name: "AuthCodeRoutingProtocol"),
                .project(target: "GuestListScene", path: "../GuestList")
            ]
        ),
        Target(
            name: "AuthCodeScene",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.AuthCodeScene",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Sources/**"],
            resources: ["Targets/Scene/Resources/**"],
            dependencies: [
                .target(name: "AuthCodeRouter"),
                .project(target: "DesignSystem", path: "../../DesignSystem"),
                .project(target: "Models", path: "../../Core/CoreKit"),
                .project(target: "DataSource", path: "../../DataSource"),
                .external(name: "SnapKit"),
//                .external(name: "Kingfisher")
            ]
        ),
        Target(
            name: "AuthCodeSceneTests",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.AuthCodeSceneTests",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Tests/**"],
            dependencies: [.target(name: "AuthCodeScene")]
        ),
    ]
)
