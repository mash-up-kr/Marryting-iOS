//
//  RightArrowButton.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

public final class RightArrowButton: UIButton {
    
    // MARK: 프로퍼티
    
    private let height: CGFloat                     = 56
    
    private let imagePadding: CGFloat               = 22
    
    // MARK: 색상
    
    private let enabledBackgroundColor: UIColor?    = Pallete.Dark.subGreen.color
    
    private let disabledBackgroundColor: UIColor?   = Pallete.Dark.grey300.color
    
    private let enabledTextColor: UIColor?          = Pallete.Dark.grey800.color
    
    private let disabledTextColor: UIColor?         = Pallete.Dark.grey200.color
    
    private let highlightedTextColor: UIColor?      = Pallete.Dark.white.color
    
    public var enable: Bool                         = true {
        didSet {
            self.adjustButton(as: self.enable)
        }
    }
    
    public var title: String                        = "" {
        didSet {
            self.setTitle(title, for: .normal)
        }
    }
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        attribute()
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func adjustButton(as enable: Bool) {
        if enable == true { self.makeEnable()  }
        else              { self.makeDisable() }
    }
    
    private func makeEnable() {
        
        self.isUserInteractionEnabled   = true
        self.backgroundColor            = self.enabledBackgroundColor
        self.setTitleColor(self.enabledTextColor, for: .normal)
        self.setImage(createButtonImage(buttonType: .enable), for: .normal)
    }
    
    private func makeDisable() {
        self.isUserInteractionEnabled   = false
        self.backgroundColor            = self.disabledBackgroundColor
        self.setTitleColor(self.disabledTextColor, for: .normal)
        self.setImage(createButtonImage(buttonType: .disable), for: .normal)
    }
}

extension RightArrowButton {
    private func attribute() {
        
        self.setTitleColor(self.enabledTextColor, for: .normal)
        self.setImage(createButtonImage(buttonType: .enable), for: .normal)
        
        self.setTitleColor(self.highlightedTextColor, for: .highlighted)
        self.setImage(createButtonImage(buttonType: .highlight), for: .highlighted)
        
        self.titleLabel?.font = .systemFont(ofSize: 25, weight: .semibold)
    }
    
    private func layout() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: height)
        ])
        self.titleLabel?.font = .systemFont(ofSize: 25, weight: .semibold)
        self.layer.cornerRadius = 28
        self.semanticContentAttribute = .forceRightToLeft
        
        self.titleEdgeInsets   = .init(top: 0, left: -imagePadding, bottom: 0, right: imagePadding)
        self.contentEdgeInsets = .init(top: 8, left: imagePadding + 36, bottom: 8, right: 8)
        self.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension RightArrowButton {
    
    enum RightArrowButtonType {
        case enable
        case highlight
        case disable
        
        var imageName: String {
            switch self {
            case .enable:
                return "arrow_white"
            case .highlight:
                return "arrow_green"
            case .disable:
                return "arrow_gray"
            }
        }
        
        var backgroundColor: UIColor? {
            switch self {
            case .enable:
                return Pallete.Dark.grey800.color
            case .highlight:
                return Pallete.Dark.white.color
            case .disable:
                return Pallete.Dark.grey200.color
            }
        }
    }

    private func createButtonImage(buttonType: RightArrowButtonType) -> UIImage {
        let view = UIView()
        let image = UIImage(named: buttonType.imageName)
        let imageView = UIImageView(image: image)
        imageView.bounds.size = CGSize(width: 16, height: 16)
        view.addSubview(imageView)
        view.frame = .init(x: 0, y: 0, width: 40, height: 40)
        view.layer.cornerRadius = 20
        imageView.center = view.center
        view.backgroundColor = buttonType.backgroundColor
        
        return view.asImage()
    }
}
