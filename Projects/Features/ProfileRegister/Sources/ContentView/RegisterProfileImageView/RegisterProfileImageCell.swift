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
    func deleteImage(for image: UIImage)
}
final class RegisterProfileImageCell: UICollectionViewCell {
    static let id = "RegisterProfileImageCell"
    
    weak var delegate: RegisterProfileImageCellDelegate?
    
    // MARK: UI
    
    lazy var registerimageButton: MTButton = {
        let view = MTButton.create(.addImage)
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    lazy var dropImageButton: UIButton = {
        let button = UIButton()
        button.setImage(.create(.btn_dropImage_button), for: .normal)
        return button
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
        addSubview(dropImageButton)
        
        registerimageButton.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-56)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-56)
        }
        
        dropImageButton.snp.makeConstraints { make in
            make.height.width.equalTo(48)
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        registerimageButton.addTarget(self, action: #selector(tapRegisterimageButton), for: .touchUpInside)
        dropImageButton.addTarget(self, action: #selector(deleteImage), for: .touchUpInside)
    }
    
    func setImage(image: UIImage?) {
        imageView.image = image
        imageView.isHidden = image == nil
        dropImageButton.isHidden = image == nil
        registerimageButton.isHidden = image != nil
    }
    
    @objc func deleteImage() {
        guard let image = imageView.image else { return }
        delegate?.deleteImage(for: image)
    }
    
    @objc func tapRegisterimageButton(_ sender: UIButton) {
        delegate?.tapRegisterimageButton(sender)
    }
}
