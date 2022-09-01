//
//  TagCell.swift
//  ProfileRegister
//
//  Created by Yoojin Park on 2022/07/18.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import DesignSystem
import SnapKit

// MARK: - Cell 설정
final class TagCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout {
    
    // MARK: Configure UI
    
    lazy var baseView: UIView = {
        let view = UIView()
        view.layer.borderColor = Pallete.Dark.grey500.color?.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .body1()
        label.textColor = Pallete.Dark.grey200.color
        return label
    }()
    
    // MARK: Properties
    
    var isClicked: Bool = false
    
    func click(backgroundColor: UIColor?, borderColor: UIColor?) {
        baseView.backgroundColor = backgroundColor
        baseView.layer.borderColor = borderColor?.cgColor
        titleLabel.font = .h5()
        titleLabel.textColor = Pallete.Dark.white.color
        isClicked = true
    }
    
    func unclick() {
        baseView.backgroundColor = .clear
        baseView.layer.borderColor = Pallete.Dark.grey500.color?.cgColor
        titleLabel.font = .body1()
        titleLabel.textColor = Pallete.Dark.grey200.color
        isClicked = false
    }
    
    // MARK: Object lifecycle
    
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
    
    // MARK: Function
    
    func setData(_ keyword: SelectTagListKeywordModel) {
        titleLabel.text = keyword.keyword
        titleLabel.sizeToFit()
    }
    
    // MARK: Configure UI
    
    private func configureUI() {
        unclick()
        
        addSubview(baseView)
        baseView.addSubview(titleLabel)
        
        baseView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
}
