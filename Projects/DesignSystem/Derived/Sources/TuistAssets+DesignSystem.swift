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
  public enum Assets {
    public static let btnAppleLogin = DesignSystemImages(name: "btn_apple_login")
    public static let icArrowBack = DesignSystemImages(name: "ic_arrow_back")
    public static let icCheckBlack = DesignSystemImages(name: "ic_check_black")
    public static let icClose = DesignSystemImages(name: "ic_close")
    public static let icClover = DesignSystemImages(name: "ic_clover")
    public static let icDropdown = DesignSystemImages(name: "ic_dropdown")
    public static let icEdit = DesignSystemImages(name: "ic_edit")
    public static let icEditEnable = DesignSystemImages(name: "ic_edit_enable")
    public static let icEditHighlight = DesignSystemImages(name: "ic_edit_highlight")
    public static let icEnlarge = DesignSystemImages(name: "ic_enlarge")
    public static let icError = DesignSystemImages(name: "ic_error")
    public static let icHeart = DesignSystemImages(name: "ic_heart")
    public static let icHeartEnable = DesignSystemImages(name: "ic_heart_enable")
    public static let icHeartHighlight = DesignSystemImages(name: "ic_heart_highlight")
    public static let icMainDarkDisable = DesignSystemImages(name: "ic_main_dark_disable")
    public static let icMainDarkEnable = DesignSystemImages(name: "ic_main_dark_enable")
    public static let icMainDarkHighlight = DesignSystemImages(name: "ic_main_dark_highlight")
    public static let icMainLightDisable = DesignSystemImages(name: "ic_main_light_disable")
    public static let icMainLightEnable = DesignSystemImages(name: "ic_main_light_enable")
    public static let icMainLightHighlight = DesignSystemImages(name: "ic_main_light_highlight")
    public static let icMainSmallDarkEnable = DesignSystemImages(name: "ic_main_small_dark_enable")
    public static let icMainSmallDarkHighlight = DesignSystemImages(name: "ic_main_small_dark_highlight")
    public static let icRightEnable = DesignSystemImages(name: "ic_right_enable")
    public static let icRightHighlight = DesignSystemImages(name: "ic_right_highlight")
    public static let icRing = DesignSystemImages(name: "ic_ring")
    public static let icTrashDisable = DesignSystemImages(name: "ic_trash_disable")
    public static let icTrashEnable = DesignSystemImages(name: "ic_trash_enable")
    public static let icTrashHighlight = DesignSystemImages(name: "ic_trash_highlight")
    public static let imgBubble = DesignSystemImages(name: "img_bubble")
    public static let imgBubbleBack = DesignSystemImages(name: "img_bubble_back")
    public static let logo = DesignSystemImages(name: "logo")
  }
  public enum Colors {
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

public struct DesignSystemImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = DesignSystemResources.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

public extension DesignSystemImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the DesignSystemImages.image property")
  convenience init?(asset: DesignSystemImages) {
    #if os(iOS) || os(tvOS)
    let bundle = DesignSystemResources.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:enable all
// swiftformat:enable all
