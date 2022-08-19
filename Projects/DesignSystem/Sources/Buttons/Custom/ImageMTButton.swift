//
//  ImageMTButton.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/15.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

final class ImageMTButton: MTButton {
    
    
    // MARK: Parameters
    
    var customButtonType: CustomButtonType   = .iconMainLight
    
    convenience init(customButtonType: CustomButtonType) {
        self.init(frame: .zero)
        self.customButtonType = customButtonType

        attribute()
        layout()
    }
    
    override func attribute() {
        self.setBackgroundImage(self.customButtonType.enableImage, for: .normal)
        self.setBackgroundImage(self.customButtonType.highlightedImage, for: .highlighted)
        self.setBackgroundImage(self.customButtonType.disabledImage, for: .disabled)
    }
    
    override func layout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: ButtonConstant.circleButtonHeight),
            self.widthAnchor.constraint(equalToConstant: ButtonConstant.circleButtonHeight)
        ])
    }
    
}

extension ImageMTButton {

    // MARK: 버튼 타입

    public enum CustomButtonType {
        case iconSub1Light
        case iconSub2Light
        case iconMainLight
        case iconSubDark
        
        var enableImage: UIImage? {
            switch self {
            case .iconSub1Light:
                return .create(.ic_right_enable)
            case .iconSub2Light:
                return .create(.ic_edit_enable)
            case .iconMainLight:
                return .create(.ic_heart_enable)
            case .iconSubDark:
                return .create(.ic_trash_enable)
            }
        }
        
        var highlightedImage: UIImage? {
            switch self {
            case .iconSub1Light:
                return .create(.ic_right_highlight)
            case .iconSub2Light:
                return .create(.ic_edit_highlight)
            case .iconMainLight:
                return .create(.ic_heart_highlight)
            case .iconSubDark:
                return .create(.ic_trash_highlight)
            }
        }
        
        var disabledImage: UIImage? {
            switch self {
            case .iconSubDark:
                return .create(.ic_trash_disable)
            default:
                return nil
            }
        }
    }
    
}
