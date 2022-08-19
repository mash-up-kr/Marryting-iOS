//
//  BaseButton.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/15.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

public class MTButton: UIButton, CodeBased {

    public var title: String = "" {
        didSet {
            self.setTitle(title, for: .normal)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        layout()
        attribute()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func attribute() { }

    func layout() { }
}

extension MTButton {

    public static func create(_ type: MTButtonType) -> MTButton {
        switch type {
        case .mainDarkTextImage:
            return TextImageMTButton(customButtonType: .mainDark)
        case .mainLightTextImage:
            return TextImageMTButton(customButtonType: .mainLight)
        case .mainSmallDarkTextImage:
            return TextImageMTButton(customButtonType: .mainSmallDark)
        case .iconSub1Light:
            return ImageMTButton(customButtonType: .iconSub1Light)
        case .iconSub2Light:
            return ImageMTButton(customButtonType: .iconSub2Light)
        case .iconMainLight:
            return ImageMTButton(customButtonType: .iconMainLight)
        case .iconSubDark:
            return ImageMTButton(customButtonType: .iconSubDark)
        case .subLight:
            return TextMTButton()
        case .text:
            return TextMTButton()
        }
    }
}
