import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(
            url: "https://github.com/SnapKit/SnapKit.git",
            requirement: .upToNextMajor(from: "5.0.1")
        ),
        .remote(
            url: "https://github.com/onevcat/Kingfisher.git",
            requirement: .upToNextMajor(from: "7.0.0")
        ),
        .remote(
            url: "https://github.com/mikaoj/BSImagePicker.git",
            requirement: .upToNextMajor(from: "3.3.1")
        )
    ],
    platforms: [.iOS]
)
