import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
    name: "___VARIABLE_sceneName___",
    targets: [
        Target(
            name: "___VARIABLE_sceneName___RoutingProtocol",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.___VARIABLE_sceneName___RoutingProtocol",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/RoutingProtocol/**"],
            resources: [],
            dependencies: []
        ),
        Target(
            name: "___VARIABLE_sceneName___Router",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.___VARIABLE_sceneName___Router",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Router/**"],
            resources: [],
            dependencies: [
                .target(name: "___VARIABLE_sceneName___RoutingProtocol"),
//                .project(target: "TargetScene", path: "../Target"),
            ]
        ),
        Target(
            name: "___VARIABLE_sceneName___Scene",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.___VARIABLE_sceneName___Scene",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Sources/**"],
            resources: ["Targets/Scene/Resources/**"],
            dependencies: [
                .target(name: "___VARIABLE_sceneName___Router"),
                .project(target: "DesignSystem", path: "../../DesignSystem"),
                .project(target: "Models", path: "../../Core/CoreKit"),
                .project(target: "DataSource", path: "../../DataSource"),
                .external(name: "SnapKit"),
//                .external(name: "Kingfisher")
            ]
        ),
        Target(
            name: "___VARIABLE_sceneName___SceneTests",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.___VARIABLE_sceneName___SceneTests",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Tests/**"],
            dependencies: [.target(name: "___VARIABLE_sceneName___Scene")]
        ),
    ]
)
