//
//  EnterUserInfoTextField.swift
//  ProfileRegister
//
//  Created by Yoojin Park on 2022/07/18.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

public final class UserInfoTextField: UITextField {
    
    // MARK: Properties
    var textPadding = UIEdgeInsets(
        top: 32,
        left: 20,
        bottom: 16,
        right: 20
    )
    
    // MARK: UI Properties
    public var type: UserInfo = .name {
        didSet {
            titleLabel.text = type.korean
            setPlaceHolder(type.placeholder)
            if type == .gender {
                setSelectGenderMode()
            }
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .body3()
        label.textColor = Pallete.Dark.grey400.color
        return label
    }()
    
    lazy var pickerview: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        return pickerView
    }()
    
    lazy var genderData = ["남성", "여성"]
    
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
    
    func setPlaceHolder(_ text: String) {
        attributedPlaceholder = NSAttributedString(string: text,
                                                   attributes: [NSAttributedString.Key.foregroundColor: Pallete.Dark.grey400.color ?? .gray])
    }
    
    func setSelectGenderMode() {
        self.inputView = pickerview
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
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        if let clearButton = self.value(forKey: "clearButton") as? UIButton {
            let templateImage = clearButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
            clearButton.setImage(templateImage, for: .normal)
            clearButton.setImage(templateImage, for: .highlighted)
            clearButton.tintColor = Pallete.Dark.grey400.color
        }
    }
    
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }

    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    public override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    public override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
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

extension UserInfoTextField: UIPickerViewDelegate, UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return  genderData.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderData[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = genderData[row]
        // TODO: self.endEditing(true)하고 delegate 로 다음꺼 자동 선택
    }
}
