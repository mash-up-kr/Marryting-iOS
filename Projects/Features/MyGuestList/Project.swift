import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
    name: "MyGuestList",
    targets: [
        Target(
            name: "MyGuestListRoutingProtocol",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.MyGuestListRoutingProtocol",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/RoutingProtocol/**"],
            resources: [],
            dependencies: [
                .project(target: "Models", path: "../../Core/CoreKit")
            ]
        ),
        Target(
            name: "MyGuestListRouter",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.MyGuestListRouter",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Router/**"],
            resources: [],
            dependencies: [
                .target(name: "MyGuestListRoutingProtocol"),
//                .project(target: "TargetScene", path: "../Target"),
            ]
        ),
        Target(
            name: "MyGuestListScene",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.MyGuestListScene",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Sources/**"],
            resources: ["Targets/Scene/Resources/**"],
            dependencies: [
                .target(name: "MyGuestListRouter"),
                .project(target: "DesignSystem", path: "../../DesignSystem"),
                .project(target: "Models", path: "../../Core/CoreKit"),
                .project(target: "DataSource", path: "../../DataSource"),
                .external(name: "SnapKit"),
                .external(name: "Kingfisher")
            ]
        ),
        Target(
            name: "MyGuestListSceneTests",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.MyGuestListSceneTests",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Tests/**"],
            dependencies: [.target(name: "MyGuestListScene")]
        ),
    ]
)
