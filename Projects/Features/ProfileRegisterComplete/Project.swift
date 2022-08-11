import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
    name: "ProfileRegisterComplete",
    targets: [
        Target(
            name: "ProfileRegisterCompleteRoutingProtocol",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.ProfileRegisterCompleteRoutingProtocol",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/RoutingProtocol/**"],
            resources: [],
            dependencies: []
        ),
        Target(
            name: "ProfileRegisterCompleteRouter",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.ProfileRegisterCompleteRouter",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Router/**"],
            resources: [],
            dependencies: [
                .target(name: "ProfileRegisterCompleteRoutingProtocol"),
                .project(target: "MeetingListScene", path: "../MeetingList")
//                .project(target: "TargetScene", path: "../Target"),
            ]
        ),
        Target(
            name: "ProfileRegisterCompleteScene",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.ProfileRegisterCompleteScene",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Sources/**"],
            resources: ["Targets/Scene/Resources/**"],
            dependencies: [
                .target(name: "ProfileRegisterCompleteRouter"),
                .project(target: "DesignSystem", path: "../../DesignSystem"),
                .project(target: "Models", path: "../../Core/CoreKit"),
                .project(target: "DataSource", path: "../../DataSource"),
                .external(name: "SnapKit"),
                .external(name: "Lottie")
            ]
        ),
        Target(
            name: "ProfileRegisterCompleteSceneTests",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.ProfileRegisterCompleteSceneTests",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Tests/**"],
            dependencies: [.target(name: "ProfileRegisterCompleteScene")]
        ),
    ]
)
