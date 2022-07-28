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

protocol RegisterProfileImageCellDelegate: AnyObject {
    func tapRegisterimageButton(_ sender: UIButton)
}
final class RegisterProfileImageCell: UICollectionViewCell {
    static let id = "RegisterProfileImageCell"
    
    weak var delegate: RegisterProfileImageCellDelegate?
    
    // MARK: UI
    
    lazy var registerimageButton: AddImageButton = {
        let view = AddImageButton()
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 16
        return imageView
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
        addSubview(registerimageButton)
        addSubview(imageView)
        
        registerimageButton.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        registerimageButton.addTarget(self, action: #selector(tapRegisterimageButton), for: .touchUpInside)
    }
    
    func setImage(image: UIImage?) {
        imageView.image = image
        imageView.isHidden = image == nil
        registerimageButton.isHidden = image != nil
    }
    
    @objc func tapRegisterimageButton(_ sender: AddImageButton) {
        delegate?.tapRegisterimageButton(sender)
    }
}
