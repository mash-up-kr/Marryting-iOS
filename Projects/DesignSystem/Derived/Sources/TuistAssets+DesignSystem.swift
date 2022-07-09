// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum DesignSystemAsset {
  public static let background = DesignSystemColors(name: "Background")
  public static let errorRed = DesignSystemColors(name: "Error_Red")
  public static let main100 = DesignSystemColors(name: "Main_100")
  public static let main200 = DesignSystemColors(name: "Main_200")
  public static let main300 = DesignSystemColors(name: "Main_300")
  public static let subBlue = DesignSystemColors(name: "Sub_Blue")
  public static let subGreen = DesignSystemColors(name: "Sub_Green")
  public static let subPurple = DesignSystemColors(name: "Sub_Purple")
  public static let subYellow = DesignSystemColors(name: "Sub_Yellow")
  public static let black = DesignSystemColors(name: "Black")
  public static let grey100 = DesignSystemColors(name: "Grey_100")
  public static let grey200 = DesignSystemColors(name: "Grey_200")
  public static let grey300 = DesignSystemColors(name: "Grey_300")
  public static let grey400 = DesignSystemColors(name: "Grey_400")
  public static let grey500 = DesignSystemColors(name: "Grey_500")
  public static let grey600 = DesignSystemColors(name: "Grey_600")
  public static let grey700 = DesignSystemColors(name: "Grey_700")
  public static let grey800 = DesignSystemColors(name: "Grey_800")
  public static let white = DesignSystemColors(name: "White")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class DesignSystemColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension DesignSystemColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: DesignSystemColors) {
    let bundle = DesignSystemResources.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:enable all
// swiftformat:enable all
