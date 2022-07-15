//
//  MTButtonWithText.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/15.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

public final class TextMTButton: UIButton, CodeBased {

    // MARK: Parameters
    public var customButtonType: CustomButtonType

    public var title: String                        = "" {
        didSet {
            self.setTitle(title, for: .normal)
        }
    }

    override init(frame: CGRect) {
        self.customButtonType = .subLight
        super.init(frame: frame)

        layout()
        attribute()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func attribute() {
        self.setTitleColor(customButtonType.enableTextColor, for: .normal)
        self.backgroundColor = customButtonType.enableBackgroundColor

        self.setBackgroundColor(customButtonType.highlightedBackgroundColor!, for: .highlighted)

        self.titleLabel?.font = .subtitle1(name: .montserrat)
        self.layer.cornerRadius = Constant.buttonHeight / 2
        self.layer.masksToBounds = true
    }

    func layout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: Constant.buttonHeight),
            self.widthAnchor.constraint(equalToConstant: Constant.longButtonWidth)
        ])
    }

}

extension TextMTButton {

    public enum CustomButtonType {
        case subLight

        var enableTextColor: UIColor? {
            return Pallete.Light.white.color
        }

        var enableBackgroundColor: UIColor? {
            return Pallete.Light.grey800.color
        }

        var highlightedBackgroundColor: UIColor? {
            return Pallete.Light.main300.color
        }
    }


}
