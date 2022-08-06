//
//  MeetingHeaderView.swift
//  MeetingListScene
//
//  Created by 박건우 on 2022/08/07.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import DesignSystem
import SnapKit

final class MeetingHeaderView: UICollectionReusableView {
    
    lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.text = "Select\nan Wedding"
        v.font = .h2(name: .montserrat)
        v.textColor = Pallete.Light.grey800.color
        v.numberOfLines = 2
        return v
    }()
    
    lazy var subtitleLabel: UILabel = {
        let v = UILabel()
        var attributedText: NSMutableAttributedString = .init(string: "")
        attributedText.append(NSAttributedString(string: "초대받은 ", attributes: [
            .font: UIFont.h5(), .foregroundColor: Pallete.Light.grey500.color ?? UIColor.gray
        ]))
        attributedText.append(NSAttributedString(string: "결혼식", attributes: [
            .font: UIFont.h5(), .foregroundColor: Pallete.Light.main300.color ?? UIColor.gray
        ]))
        attributedText.append(NSAttributedString(string: "을\n선택해주세요", attributes: [
            .font: UIFont.h5(), .foregroundColor: Pallete.Light.grey500.color ?? UIColor.gray
        ]))
        v.attributedText = attributedText
        v.numberOfLines = 2
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    private func setUI() {
        addSubviews(
            titleLabel,
            subtitleLabel
        )
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(32)
            make.top.equalTo(safeAreaLayoutGuide).inset(60)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(32)
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
    }
}
