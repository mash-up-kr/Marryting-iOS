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
  public static let backgroundDark = DesignSystemColors(name: "Background_dark")
  public static let backgroundLight = DesignSystemColors(name: "Background_light")
  public static let errorRed = DesignSystemColors(name: "Error_Red")
  public static let errorRedDark = DesignSystemColors(name: "Error_Red_dark")
  public static let errorRedLight = DesignSystemColors(name: "Error_Red_light")
  public static let main100 = DesignSystemColors(name: "Main_100")
  public static let main200 = DesignSystemColors(name: "Main_200")
  public static let main300 = DesignSystemColors(name: "Main_300")
  public static let subBlue = DesignSystemColors(name: "Sub_Blue")
  public static let subBlueDark = DesignSystemColors(name: "Sub_Blue_dark")
  public static let subBlueLight = DesignSystemColors(name: "Sub_Blue_light")
  public static let subGreen = DesignSystemColors(name: "Sub_Green")
  public static let subGreenDark = DesignSystemColors(name: "Sub_Green_dark")
  public static let subGreenLight = DesignSystemColors(name: "Sub_Green_light")
  public static let subPurple = DesignSystemColors(name: "Sub_Purple")
  public static let subPurpleDark = DesignSystemColors(name: "Sub_Purple_dark")
  public static let subPurpleLight = DesignSystemColors(name: "Sub_Purple_light")
  public static let subYellow = DesignSystemColors(name: "Sub_Yellow")
  public static let subYellowDark = DesignSystemColors(name: "Sub_Yellow_dark")
  public static let subYellowLight = DesignSystemColors(name: "Sub_Yellow_light")
  public static let black = DesignSystemColors(name: "Black")
  public static let grey100 = DesignSystemColors(name: "Grey_100")
  public static let grey100Dark = DesignSystemColors(name: "Grey_100_dark")
  public static let grey100Light = DesignSystemColors(name: "Grey_100_light")
  public static let grey200 = DesignSystemColors(name: "Grey_200")
  public static let grey200Dark = DesignSystemColors(name: "Grey_200_dark")
  public static let grey200Light = DesignSystemColors(name: "Grey_200_light")
  public static let grey300 = DesignSystemColors(name: "Grey_300")
  public static let grey300Dark = DesignSystemColors(name: "Grey_300_dark")
  public static let grey300Light = DesignSystemColors(name: "Grey_300_light")
  public static let grey400 = DesignSystemColors(name: "Grey_400")
  public static let grey400Dark = DesignSystemColors(name: "Grey_400_dark")
  public static let grey400Light = DesignSystemColors(name: "Grey_400_light")
  public static let grey500 = DesignSystemColors(name: "Grey_500")
  public static let grey500Dark = DesignSystemColors(name: "Grey_500_dark")
  public static let grey500Light = DesignSystemColors(name: "Grey_500_light")
  public static let grey600 = DesignSystemColors(name: "Grey_600")
  public static let grey600Dark = DesignSystemColors(name: "Grey_600_dark")
  public static let grey600Light = DesignSystemColors(name: "Grey_600_light")
  public static let grey700 = DesignSystemColors(name: "Grey_700")
  public static let grey700Dark = DesignSystemColors(name: "Grey_700_dark")
  public static let grey700Light = DesignSystemColors(name: "Grey_700_light")
  public static let grey800 = DesignSystemColors(name: "Grey_800")
  public static let grey800Dark = DesignSystemColors(name: "Grey_800_dark")
  public static let grey800Light = DesignSystemColors(name: "Grey_800_light")
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
