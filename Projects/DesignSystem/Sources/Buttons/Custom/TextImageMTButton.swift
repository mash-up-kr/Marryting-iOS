//
//  RightArrowButton.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/12.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

/// 텍스트와 이미지가 함께 쓰이는 Marryting 버튼
/// - Parameters:
///   - customButtonType: 3가지 버튼 타입
final class TextImageMTButton: MTButton {

    // MARK: Parameters

    var customButtonType: CustomButtonType   = .mainLight

    convenience init(customButtonType: CustomButtonType) {
        self.init(frame: .zero)
        self.customButtonType = customButtonType
        layout()
        attribute()
    }


    override func attribute() {
        self.setBackgroundColor(customButtonType.enabledBackgroundColor!, for: .normal)
        self.setTitleColor(customButtonType.enabledTextColor, for: .normal)
        self.setImage(customButtonType.enableImage, for: .normal)

        self.setBackgroundColor(customButtonType.highlightedBackgroundColor!, for: .highlighted)
        self.setTitleColor(customButtonType.highlightedTextColor, for: .highlighted)
        self.setImage(customButtonType.highlightImage, for: .highlighted)

        self.setBackgroundColor(customButtonType.disabledBackgroundColor!, for: .disabled)
        self.setTitleColor(customButtonType.disabledTextColor, for: .disabled)
        self.setImage(customButtonType.disableImage, for: .disabled)
        self.titleLabel?.font = .subtitle1(name: .montserrat)
        self.layer.cornerRadius = ButtonConstant.buttonHeight / 2
        self.layer.masksToBounds = true
    }

    override func layout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: ButtonConstant.buttonHeight)
        ])
        self.semanticContentAttribute = customButtonType.contentAttribute
        self.titleEdgeInsets   = .init(top: 0,
                                       left: -customButtonType.imagePadding,
                                       bottom: 0,
                                       right: customButtonType.imagePadding)
        self.contentEdgeInsets = .init(top: 8,
                                       left: customButtonType.imagePadding + customButtonType.contentLeftPadding,
                                       bottom: 8,
                                       right: customButtonType.contentRightPadding)
        self.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension TextImageMTButton {

    // MARK: 버튼 타입

    public enum CustomButtonType {
        case mainPlusDark
        case mainDark
        case mainLight
        case mainSmallDark

        var contentAttribute:  UISemanticContentAttribute {
            switch self {
            case .mainPlusDark:
                return .forceRightToLeft
            case .mainDark:
                return .forceRightToLeft
            case .mainLight:
                return .forceRightToLeft
            case .mainSmallDark:
                return .forceLeftToRight
            }
        }

        var enabledBackgroundColor: UIColor? {
            switch self {
            case .mainPlusDark:
                return Pallete.Dark.subGreen.color
            case .mainDark:
                return Pallete.Dark.subGreen.color
            case .mainLight:
                return Pallete.Light.grey800.color
            case .mainSmallDark:
                return Pallete.Dark.grey700.color
            }
        }

        var disabledBackgroundColor: UIColor?  {
            switch self {
            case .mainPlusDark:
                return Pallete.Dark.grey300.color
            case .mainDark:
                return Pallete.Dark.grey300.color
            case .mainLight:
                return Pallete.Dark.grey300.color
            case .mainSmallDark:
                return Pallete.Dark.grey300.color
            }
        }

        var enabledTextColor: UIColor?  {
            switch self {
            case .mainPlusDark:
                return Pallete.Dark.grey800.color
            case .mainDark:
                return Pallete.Dark.grey800.color
            case .mainLight:
                return Pallete.Light.white.color
            case .mainSmallDark:
                return Pallete.Dark.grey200.color
            }
        }

        var disabledTextColor: UIColor?  {
            switch self {
            case .mainPlusDark:
                return Pallete.Dark.grey200.color
            case .mainDark:
                return Pallete.Dark.grey200.color
            case .mainLight:
                return Pallete.Light.grey200.color
            case .mainSmallDark:
                return nil
            }
        }

        var highlightedTextColor: UIColor? {
            return Pallete.Dark.white.color
        }

        var highlightedBackgroundColor: UIColor? {
            switch self {
            case .mainPlusDark:
                return Pallete.Dark.subGreen.color
            case .mainDark:
                return Pallete.Dark.subGreen.color
            case .mainLight:
                return Pallete.Dark.main300.color
            case .mainSmallDark:
                return Pallete.Dark.grey600.color
            }
        }

        var enableImage: UIImage? {
            switch self {
            case .mainPlusDark:
                return .create(.ic_plus_enable)
            case .mainDark:
                return .create(.ic_main_dark_enable)
            case .mainLight:
                return .create(.ic_main_light_enable)
            case .mainSmallDark:
                return .create(.ic_main_small_dark_enable)
            }
        }

        var highlightImage: UIImage? {
            switch self {
            case .mainPlusDark:
                return .create(.ic_plus_highlight)
            case .mainDark:
                return .create(.ic_main_dark_highlight)
            case .mainLight:
                return .create(.ic_main_light_highlight)
            case .mainSmallDark:
                return .create(.ic_main_small_dark_highlight)
            }
        }

        var disableImage: UIImage? {
            switch self {
            case .mainPlusDark:
                return .create(.ic_plus_disable)
            case .mainDark:
                return .create(.ic_main_dark_disable)
            case .mainLight:
                return .create(.ic_main_light_disable)
            case .mainSmallDark:
                return nil
            }
        }

        var imagePadding: CGFloat {
            switch self {
            case .mainPlusDark:
                return 22
            case .mainDark:
                return 22
            case .mainLight:
                return 22
            case .mainSmallDark:
                return 0
            }
        }

        var contentLeftPadding: CGFloat {
            switch self {
            case .mainPlusDark:
                return 36
            case .mainDark:
                return 36
            case .mainLight:
                return 36
            case .mainSmallDark:
                return 8
            }
        }

        var contentRightPadding: CGFloat {
            switch self {
            case .mainPlusDark:
                return 8
            case .mainDark:
                return 8
            case .mainLight:
                return 8
            case .mainSmallDark:
                return 24
            }
        }

        var imageViewWidth: CGFloat {
            return 40
        }
    }
}
