//
//  EnterUserInfoView.swift
//  ProfileRegister
//
//  Created by Yoojin Park on 2022/07/18.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import DesignSystem
import SnapKit

struct EnterUserInfoViewModel {
    var name: String
    var gender: String
    var birth: String
    var address: String
    var career: String
}

protocol ProfileRegisterContentView {
    func hideKeyboardAndSendUserInfo()
}
protocol EnterUserInfoViewDelegate: AnyObject {
    func sendUserInfo(_ userInfo: ProfileRegister.DidTapFirstPageNext.Request, allEntered: Bool)
}
final class EnterUserInfoView: UIView, ProfileRegisterContentView {
    weak var delegate: EnterUserInfoViewDelegate?
    // MARK: UI Properties
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInset.bottom = 40
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let contentView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 14
        return stackView
    }()
    
    let nameTextField: UserInfoTextField = {
        let textField = UserInfoTextField()
        textField.type = .name
        return textField
    }()
    
    // 성별 선택 textField 커스텀 필요
    let genderTextField: UserInfoTextField = {
        let textField = UserInfoTextField()
        textField.type = .gender
        return textField
    }()
    
    // 생년월일 textField 커스텀 필요
    let birthTextField: UserInfoTextField = {
        let textField = UserInfoTextField()
        textField.type = .birth
        return textField
    }()
    
    let addressTextField: UserInfoTextField = {
        let textField = UserInfoTextField()
        textField.type = .address
        return textField
    }()
    
    let jobTextField: UserInfoTextField = {
        let textField = UserInfoTextField()
        textField.type = .job
        return textField
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

    var viewModel: EnterUserInfoViewModel? {
        didSet {
            nameTextField.text = viewModel?.name
            addressTextField.text = viewModel?.address
            jobTextField.text = viewModel?.career
            birthTextField.text = viewModel?.birth
            genderTextField.text = viewModel?.gender
        }
    }

    // MARK: Configure UI
    
    private func configureUI() {
        backgroundColor = Pallete.Dark.background.color
        
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addArrangedSubview(nameTextField)
        contentView.addArrangedSubview(genderTextField)
        contentView.addArrangedSubview(birthTextField)
        contentView.addArrangedSubview(addressTextField)
        contentView.addArrangedSubview(jobTextField)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalToSuperview()
        }
        setKeyboardObserver()
        
        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapScrollView)))
    }
    
    func setKeyboardObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object:nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(nameTextDidChange(_:)),
                                               name: UITextField.textDidChangeNotification,
                                               object: nameTextField)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(addressTextDidChange(_:)),
                                               name: UITextField.textDidChangeNotification,
                                               object: addressTextField)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(jobTextDidChange(_:)),
                                               name: UITextField.textDidChangeNotification,
                                               object: jobTextField)
    }
    
    private func characterLimit(textField: UITextField, maxLength: Int) {
        if let text = textField.text {
            // 초과되는 텍스트 제거
            if text.count >= maxLength {
                let index = text.index(text.startIndex, offsetBy: maxLength)
                let newString = text.prefix(upTo: index)
                textField.text = String(newString)
            }
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let textFieldArr = contentView.arrangedSubviews.compactMap { $0 as? UserInfoTextField }
        guard let currentTextField: UserInfoTextField = textFieldArr.first(where: { $0.isEditing}) else { return }
        let tag = currentTextField.type.tag
        let frameOriginY = 80 * tag + 14 * (tag - 1)
        let offset = CGPoint(x: 0, y: frameOriginY)
        self.scrollView.setContentOffset(offset, animated: true)
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.scrollView.contentInset.bottom = keyboardHeight + 56
        }
    }
    
    @objc private func nameTextDidChange(_ notification: Notification) {
        if let textField = notification.object as? UITextField {
            characterLimit(textField: textField, maxLength: 5)
        }
    }
    
    @objc private func addressTextDidChange(_ notification: Notification) {
        if let textField = notification.object as? UITextField {
            characterLimit(textField: textField, maxLength: 10)
        }
    }
    
    @objc private func jobTextDidChange(_ notification: Notification) {
        if let textField = notification.object as? UITextField {
            characterLimit(textField: textField, maxLength: 10)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        hideKeyboardAndSendUserInfo()
        self.scrollView.contentInset.bottom = 40
    }
    
    func hideKeyboardAndSendUserInfo() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.scrollView.setContentOffset(.zero, animated: false) // true로 하면 움직이지 않음
        }
        let name = nameTextField.text ?? ""
        let gender = genderTextField.text ?? ""
        let birth = birthTextField.text ?? ""
        let address = addressTextField.text ?? ""
        let career = jobTextField.text ?? ""
        
        let allEntered = [name, gender, birth, address, career]

        delegate?.sendUserInfo(.init(name: name, gender: gender, birth: birth, address: address, career: career), allEntered: allEntered.filter { $0.count == 0}.isEmpty)
    }
    
    @objc func tapScrollView() {
        self.endEditing(true)
    }
}
