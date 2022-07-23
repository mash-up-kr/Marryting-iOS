// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
import Foundation

// MARK: - Swift Bundle Accessor

private class BundleFinder {}

extension Foundation.Bundle {
    /// Since GuestDetailScene is a static library, the bundle containing the resources is copied into the final product.
    static var module: Bundle = {
        let bundleName = "GuestDetail_GuestDetailScene"

        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: BundleFinder.self).resourceURL,
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        fatalError("unable to find bundle named GuestDetail_GuestDetailScene")
    }()
}

// MARK: - Objective-C Bundle Accessor

@objc
public class GuestDetailSceneResources: NSObject {
   @objc public class var bundle: Bundle {
         return .module
   }
}
// swiftlint:enable all
// swiftformat:enable all
