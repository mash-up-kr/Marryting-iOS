//
//  EnterUserInfoView.swift
//  ProfileRegister
//
//  Created by Yoojin Park on 2022/07/18.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import DesignSystem

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
    
    let nameTextField: EnterUserInfoTextField = {
        let textField = EnterUserInfoTextField()
        textField.setPlaceHolder(text: "이름을 입력해주세요")
        return textField
    }()
    
    // 성별 선택 textField 커스텀 필요
    let genderTextField: EnterUserInfoTextField = {
        let textField = EnterUserInfoTextField()
        textField.setPlaceHolder(text: "성별을 선택해주세요")
        return textField
    }()
    
    // 생년월일 textField 커스텀 필요
    let birthTextField: EnterUserInfoTextField = {
        let textField = EnterUserInfoTextField()
        textField.setPlaceHolder(text: "생년월일을 선택해주세요")
        return textField
    }()
    
    let addressTextField: EnterUserInfoTextField = {
        let textField = EnterUserInfoTextField()
        textField.setPlaceHolder(text: "ex) 서울시 광진구")
        return textField
    }()
    
    let jobTextField: EnterUserInfoTextField = {
        let textField = EnterUserInfoTextField()
        textField.setPlaceHolder(text: "ex) IT 기획자")
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
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
}
