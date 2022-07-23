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

final class EnterUserInfoView: UIView {
    // MARK: UI Properties
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInset.bottom = 108
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
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let textFieldArr = contentView.arrangedSubviews.compactMap { $0 as? UserInfoTextField }
        guard let currentTextField: UserInfoTextField = textFieldArr.first(where: { $0.isEditing}) else { return }
        let tag = currentTextField.type.tag
        UIView.animate(withDuration: 0.2) { [weak self] in
            let frameOriginY = 80 * tag + 14 * (tag - 1)
            let offset = CGPoint(x: 0, y: frameOriginY)
            self?.scrollView.setContentOffset(offset, animated: false) // true로 하면 움직이지 않음
        }
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                          let keyboardRectangle = keyboardFrame.cgRectValue
                          let keyboardHeight = keyboardRectangle.height
            self.scrollView.contentInset.bottom = keyboardHeight + 56
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.scrollView.setContentOffset(.zero, animated: false) // true로 하면 움직이지 않음
        }
    }
    
    @objc func tapScrollView() {
        self.endEditing(true)
    }
}
