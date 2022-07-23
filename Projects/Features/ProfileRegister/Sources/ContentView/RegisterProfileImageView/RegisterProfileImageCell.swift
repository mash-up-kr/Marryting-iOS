//
//  RegisterProfileImageCell.swift
//  ProfileRegister
//
//  Created by Yoojin Park on 2022/07/24.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import DesignSystem
import SnapKit

final class RegisterProfileImageCell: UICollectionViewCell {
    static let id = "RegisterProfileImageCell"
    
    // MARK: UI
    
    lazy var registerimageButton: AddImageButton = {
        let view = AddImageButton()
        return view
    }()
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func configureUI() {
        self.layer.cornerRadius = 16
        addSubview(registerimageButton)
        
        registerimageButton.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
