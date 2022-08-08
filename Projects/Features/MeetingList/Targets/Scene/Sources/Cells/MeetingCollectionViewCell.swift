//
//  MeetingCollectionViewCell.swift
//  MeetingListScene
//
//  Created by 박건우 on 2022/08/06.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import DesignSystem
import SnapKit

protocol MeetingCollectionViewCellDelegate: AnyObject {
    /// 진입 버튼 클릭 이벤트
    func didTapMeetingEnterButton(id: String)
}

struct MeetingCellViewModel {
    var id: String
    var index: String
    var groomName: String
    var brideName: String
    var date: String
}

final class MeetingCollectionViewCell: UICollectionViewCell {
    
    lazy var indexLabel: UILabel = {
        let v = UILabel()
        v.font = .h2(name: .montserrat)
        v.textColor = Pallete.Light.grey100.color
        return v
    }()
    
    lazy var groomNameLabel: UILabel = {
        let v = UILabel()
        v.font = .h2()
        v.textColor = Pallete.Light.grey800.color
        return v
    }()
    
    lazy var heartIconView: UIImageView = {
        let v = UIImageView()
        v.image = .create(.ic_heart_dark)
        return v
    }()
    
    lazy var brideNameLabel: UILabel = {
        let v = UILabel()
        v.font = .h2()
        v.textColor = Pallete.Light.grey800.color
        return v
    }()
    
    lazy var dateLabel: UILabel = {
        let v = UILabel()
        v.font = .subtitle1(name: .montserrat)
        v.textColor = Pallete.Light.grey400.color
        return v
    }()
    
    lazy var enterButton: ImageMTButton = {
        let v = ImageMTButton(customButtonType: .iconSub1Light)
        v.isUserInteractionEnabled = true
        v.addTarget(self, action: #selector(didTapMeetingEnterButton), for: .touchUpInside)
        return v
    }()
    
    lazy var lineView: UIView = {
        let v = UIView()
        v.backgroundColor = Pallete.Light.grey100.color
        return v
    }()
    
    private var id: String?
    
    var viewModel: MeetingCellViewModel? {
        didSet {
            id = viewModel?.id
            if (viewModel?.index ?? "").count < 2 {
                indexLabel.text = "0\(viewModel?.index ?? "")"
            }
            else {
                indexLabel.text = viewModel?.index ?? ""
            }
            groomNameLabel.text = viewModel?.groomName ?? ""
            brideNameLabel.text = viewModel?.brideName ?? ""
            dateLabel.text = viewModel?.date ?? ""
        }
    }
    
    var delegate: MeetingCollectionViewCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }

    private func setUI() {
        backgroundColor = Pallete.Light.background.color
        
        contentView.addSubviews(
            indexLabel,
            groomNameLabel,
            heartIconView,
            brideNameLabel,
            dateLabel,
            enterButton,
            lineView
        )
        
        indexLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(32)
            make.top.equalToSuperview()
        }
        groomNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(32)
            make.top.equalTo(indexLabel.snp.bottom).offset(4)
        }
        heartIconView.snp.makeConstraints { make in
            make.leading.equalTo(groomNameLabel.snp.trailing).offset(2)
            make.height.width.equalTo(40)
            make.centerY.equalTo(groomNameLabel)
        }
        brideNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(heartIconView.snp.trailing).offset(2)
            make.centerY.equalTo(groomNameLabel)
        }
        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(32)
            make.top.equalTo(groomNameLabel.snp.bottom).offset(5)
        }
        lineView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(32)
            make.trailing.equalToSuperview()
            make.height.equalTo(2)
            make.bottom.equalToSuperview().inset(20)
        }
        enterButton.snp.makeConstraints { make in
            make.bottom.equalTo(lineView.snp.top).offset(-32)
            make.trailing.equalToSuperview().inset(32)
            make.height.width.equalTo(48)
        }
    }
    
    @objc func didTapMeetingEnterButton() {
        guard let id = id else {
            return
        }
        delegate?.didTapMeetingEnterButton(id: id)
    }
}
