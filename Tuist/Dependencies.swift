import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(
            url: "https://github.com/SnapKit/SnapKit.git",
            requirement: .upToNextMajor(from: "5.0.1")
        ),
    ],
    platforms: [.iOS]
)

extension SwiftPackageManagerDependencies {
    public static var dependencies: SwiftPackageManagerDependencies {
        .init([
            .remote(
                url: "https://github.com/SnapKit/SnapKit.git",
                requirement: .upToNextMajor(from: "5.0.1")
            )
        ])
    }
}
