import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
    name: "Splash",
    targets: [
        Target(
            name: "SplashRoutingProtocol",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.SplashRoutingProtocol",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/RoutingProtocol/**"],
            resources: [],
            dependencies: []
        ),
        Target(
            name: "SplashRouter",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.SplashRouter",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Router/**"],
            resources: [],
            dependencies: [
                .target(name: "SplashRoutingProtocol"),
                .project(target: "MeetingListScene", path: "../MeetingList"),
                .project(target: "LoginScene", path: "../Login")
//                .project(target: "TargetScene", path: "../Target"),
            ]
        ),
        Target(
            name: "SplashScene",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.SplashScene",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Sources/**"],
            resources: ["Targets/Scene/Resources/**"],
            dependencies: [
                .target(name: "SplashRouter"),
                .project(target: "DesignSystem", path: "../../DesignSystem"),
                .project(target: "Models", path: "../../Core/CoreKit"),
                .project(target: "DataSource", path: "../../DataSource"),
                .external(name: "SnapKit"),
                .external(name: "Lottie")
//                .external(name: "Kingfisher")
            ]
        ),
        Target(
            name: "SplashSceneTests",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.SplashSceneTests",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Tests/**"],
            dependencies: [.target(name: "SplashScene")]
        ),
    ]
)
