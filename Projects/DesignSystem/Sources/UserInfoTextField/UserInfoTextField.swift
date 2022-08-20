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
                clearButtonMode = .never
            } else if type == .birth {
                setSelectBirthMode()
                clearButtonMode = .never
            } else {
                clearButtonMode = .whileEditing
            }
        }
    }
    
    lazy var titleLabel: UILabel = {
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
    
    lazy var datePickerview: UIDatePicker = {
        let pickerView = UIDatePicker()
        pickerView.datePickerMode = .date
        pickerView.timeZone = TimeZone.current
        pickerView.addTarget(self,
                             action: #selector(handleDatePicker(sender:)),
                             for: .valueChanged)
        if #available(iOS 14, *) {
            pickerView.preferredDatePickerStyle = .wheels
        }
        return pickerView
    }()
    
    lazy var selectTextFieldIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .create(.ic_dropdown_gray)
        return imageView
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
    
    private func setSelectGenderMode() {
        self.inputView = pickerview
        setSelectMode()
    }
    
    private func setSelectBirthMode() {
        self.inputView = datePickerview
        setSelectMode()
    }
    
    private func setSelectMode() {
        addSubview(selectTextFieldIcon)
        
        selectTextFieldIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(37)
            make.bottom.equalToSuperview().offset(-18)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: Configure UI
    
    private func configureUI() {
        font = .subtitle1()
        textColor = Pallete.Dark.white.color
        tintColor = Pallete.Dark.white.color
        
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
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        self.text = dateFormatter.string(from: sender.date)
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
        self.text = genderData[row]
        return genderData[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = genderData[row]
        // TODO: self.endEditing(true)하고 delegate 로 다음꺼 자동 선택
    }
}
