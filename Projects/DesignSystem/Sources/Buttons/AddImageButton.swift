//
//  AddImageButton.swift
//  DesignSystem
//
//  Created by Yoojin Park on 2022/07/24.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

public final class AddImageButton: UIButton {
    let addImageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .create(.ic_addImage)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setButtonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setButtonInit()
    }
    
    private func setButtonInit() {
        backgroundColor = Pallete.Dark.grey700.color
        
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = Pallete.Dark.grey600.color?.cgColor
        
        addSubview(addImageIcon)
        addImageIcon.snp.makeConstraints { maker in
            maker.center.equalToSuperview()
        }
    }
}
