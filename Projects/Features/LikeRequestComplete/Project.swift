import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
    name: "LikeRequestComplete",
    targets: [
        Target(
            name: "LikeRequestCompleteRoutingProtocol",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.LikeRequestCompleteRoutingProtocol",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/RoutingProtocol/**"],
            resources: [],
            dependencies: []
        ),
        Target(
            name: "LikeRequestCompleteRouter",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.LikeRequestCompleteRouter",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Router/**"],
            resources: [],
            dependencies: [
                .target(name: "LikeRequestCompleteRoutingProtocol"),
//                .project(target: "TargetScene", path: "../Target"),
            ]
        ),
        Target(
            name: "LikeRequestCompleteScene",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.LikeRequestCompleteScene",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Sources/**"],
            resources: ["Targets/Scene/Resources/**"],
            dependencies: [
                .target(name: "LikeRequestCompleteRouter"),
                .external(name: "Lottie"),
                .project(target: "DesignSystem", path: "../../DesignSystem"),
                .project(target: "Models", path: "../../Core/CoreKit"),
                .project(target: "DataSource", path: "../../DataSource"),
                .external(name: "SnapKit"),
                .external(name: "Lottie")
            ]
        ),
        Target(
            name: "LikeRequestCompleteSceneTests",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.LikeRequestCompleteSceneTests",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Tests/**"],
            dependencies: [.target(name: "LikeRequestCompleteScene")]
        ),
    ]
)
