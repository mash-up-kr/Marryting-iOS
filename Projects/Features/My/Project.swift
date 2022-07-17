import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
    name: "My",
    targets: [
        Target(
            name: "MyRoutingProtocol",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.MyRoutingProtocol",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/RoutingProtocol/**"],
            resources: [],
            dependencies: []
        ),
        Target(
            name: "MyRouter",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.MyRouter",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Router/**"],
            resources: [],
            dependencies: [
                .target(name: "MyRoutingProtocol"),
//                .project(target: "TargetScene", path: "../Target"),
            ]
        ),
        Target(
            name: "MyScene",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.MyScene",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Sources/**"],
            resources: ["Targets/Scene/Resources/**"],
            dependencies: [
                .target(name: "MyRouter"),
                .project(target: "DesignSystem", path: "../../DesignSystem"),
                .project(target: "Models", path: "../../Core/CoreKit"),
                .project(target: "DataSource", path: "../../DataSource"),
                .external(name: "SnapKit"),
//                .external(name: "Kingfisher")
            ]
        ),
        Target(
            name: "MySceneTests",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.MySceneTests",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Tests/**"],
            dependencies: [.target(name: "MyScene")]
        ),
    ]
)
