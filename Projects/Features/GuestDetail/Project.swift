import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let project = Project.make(
    name: "GuestDetail",
    targets: [
        Target(
            name: "GuestDetailRoutingProtocol",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.GuestDetailRoutingProtocol",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/RoutingProtocol/**"],
            resources: [],
            dependencies: [
                .project(target: "Models", path: "../../Core/CoreKit"),
            ]
        ),
        Target(
            name: "GuestDetailRouter",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.GuestDetailRouter",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Router/**"],
            resources: [],
            dependencies: [
                .target(name: "GuestDetailRoutingProtocol"),
                .project(target: "LikeRequestScene", path: "../LikeRequest"),
//                .project(target: "TargetScene", path: "../Target"),
            ]
        ),
        Target(
            name: "GuestDetailScene",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.GuestDetailScene",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Sources/**"],
            resources: ["Targets/Scene/Resources/**"],
            dependencies: [
                .target(name: "GuestDetailRouter"),
                .target(name: "CarouselLayout"),
                .target(name: "LeftAlignmentLayout"),
                .project(target: "DesignSystem", path: "../../DesignSystem"),
                .project(target: "Models", path: "../../Core/CoreKit"),
                .project(target: "DataSource", path: "../../DataSource"),
                .external(name: "SnapKit"),
                .external(name: "Kingfisher")
            ]
        ),
        Target(
            name: "GuestDetailSceneTests",
            platform: .iOS,
            product: .staticLibrary,
            bundleId: "kr.mash-up.GuestDetailSceneTests",
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: .default,
            sources: ["Targets/Scene/Tests/**"],
            dependencies: [.target(name: "GuestDetailScene")]
        ),
        Target(
          name: "CarouselLayout",
          platform: .iOS,
          product: .staticLibrary,
          bundleId: "kr.mash-up.GuestList",
          deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
          infoPlist: .default,
          sources: ["Targets/CarouselLayout/**"],
          resources: [],
          dependencies: []
        ),
        Target(
          name: "LeftAlignmentLayout",
          platform: .iOS,
          product: .staticLibrary,
          bundleId: "kr.mash-up.GuestList",
          deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
          infoPlist: .default,
          sources: ["Targets/LeftAlignmentLayout/**"],
          resources: [],
          dependencies: []
        )
    ]
)
