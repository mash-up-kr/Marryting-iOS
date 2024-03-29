//
//  MTButtonWithText.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/15.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

final class TextMTButton: MTButton {

    // MARK: Parameters
    var customButtonType: CustomButtonType   = .subLight

    override func attribute() {
        self.setTitleColor(customButtonType.enableTextColor, for: .normal)
        self.backgroundColor = customButtonType.enableBackgroundColor

        self.setBackgroundColor(customButtonType.highlightedBackgroundColor!, for: .highlighted)

        self.titleLabel?.font = .h5()
        self.layer.cornerRadius = ButtonConstant.buttonHeight / 2
        self.layer.masksToBounds = true
    }

    override func layout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: ButtonConstant.buttonHeight),
            self.widthAnchor.constraint(equalToConstant: ButtonConstant.longButtonWidth)
        ])
    }
}

extension TextMTButton {

    // MARK: 버튼 타입
    
    enum CustomButtonType {
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
