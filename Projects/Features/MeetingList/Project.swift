import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
    name: "MeetingList",
    targets: [
        Target(
            name: "MeetingListRoutingProtocol",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.MeetingListRoutingProtocol",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/RoutingProtocol/**"],
            resources: [],
            dependencies: []
        ),
        Target(
            name: "MeetingListRouter",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.MeetingListRouter",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Router/**"],
            resources: [],
            dependencies: [
                .target(name: "MeetingListRoutingProtocol"),
                .project(target: "GuestListScene", path: "../GuestList"),
            ]
        ),
        Target(
            name: "MeetingListScene",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.MeetingListScene",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Sources/**"],
            resources: ["Targets/Scene/Resources/**"],
            dependencies: [
                .target(name: "MeetingListRouter"),
                .project(target: "DesignSystem", path: "../../DesignSystem"),
                .project(target: "Models", path: "../../Core/CoreKit"),
                .project(target: "DataSource", path: "../../DataSource"),
                .external(name: "SnapKit"),
//                .external(name: "Kingfisher")
            ]
        ),
        Target(
            name: "MeetingListSceneTests",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.MeetingListSceneTests",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Tests/**"],
            dependencies: [.target(name: "MeetingListScene")]
        ),
    ]
)
