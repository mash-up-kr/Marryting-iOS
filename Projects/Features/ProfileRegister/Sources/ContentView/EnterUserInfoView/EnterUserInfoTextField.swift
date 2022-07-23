//
//  EnterUserInfoTextField.swift
//  ProfileRegister
//
//  Created by Yoojin Park on 2022/07/18.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import DesignSystem

final class EnterUserInfoTextField: UITextField {
    
    // MARK: Properties
    var textPadding = UIEdgeInsets(
        top: 32,
        left: 20,
        bottom: 16,
        right: 20
    )
    
    // MARK: UI Properties
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .body3()
        label.text = "이름"
        label.textColor = Pallete.Dark.grey400.color
        return label
    }()
    
    // MARK: CustomView Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    // MARK: Function
    
    func setPlaceHolder(text: String) {
        attributedPlaceholder = NSAttributedString(string: text,
                                                   attributes: [NSAttributedString.Key.foregroundColor: Pallete.Dark.grey400.color ?? .gray])
    }
    
    // MARK: Configure UI
    
    private func configureUI() {
        font = .subtitle1()
        textColor = Pallete.Dark.white.color
        tintColor = Pallete.Dark.white.color
        clearButtonMode = .whileEditing
        
        layer.borderColor = Pallete.Dark.grey600.color?.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 8
        
        addTarget(self, action: #selector(activeTextFieldColor), for: .editingDidBegin)
        addTarget(self, action: #selector(deactiveTextFieldColor), for: .editingDidEnd)
        
        self.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: override
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let clearButton = self.value(forKey: "clearButton") as? UIButton {
            let templateImage = clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
            clearButton.setImage(templateImage, for: .normal)
            clearButton.setImage(templateImage, for: .highlighted)
            clearButton.tintColor = Pallete.Dark.grey400.color
        }
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        var clearButtonRect = super.clearButtonRect(forBounds: bounds)
        clearButtonRect.origin.x -= 16
        clearButtonRect.origin.y += 6
        return clearButtonRect
    }
    
    @objc func activeTextFieldColor(){
        layer.borderColor = Pallete.Dark.subGreen.color?.cgColor
        titleLabel.textColor = Pallete.Dark.subGreen.color
    }
    @objc func deactiveTextFieldColor(){
        layer.borderColor = Pallete.Dark.grey600.color?.cgColor
        titleLabel.textColor = Pallete.Dark.grey400.color
    }
}
