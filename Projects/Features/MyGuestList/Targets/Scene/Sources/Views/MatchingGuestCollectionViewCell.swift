//
//  MatchingGuestCollectionViewCell.swift
//  MyGuestListScene
//
//  Created by Woody on 2022/07/18.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import DesignSystem
import UIKit

struct MatchingGuestCellViewModel {
    var myGuestCardViewModel: MyGuestCardViewModel
    var loveMent: String
}

final class MatchingGuestCollectionViewCell: UICollectionViewCell {

    private let myGuestCardView: MyGuestCardView = {
        return $0
    }(MyGuestCardView())

    private let dialogIconImageView: UIImageView = {
        $0.image = .create(.ic_trianlge)
        return $0
    }(UIImageView())
    private let loveMentView: UIView = {
        $0.backgroundColor = Pallete.Light.background.color
        return $0
    }(UIView())

    private let loveMentLabel: UILabel = {
        // TODO: 영어 멘트일경우 체크
        $0.font = .h4()
        $0.textColor = Pallete.Light.grey700.color
        $0.numberOfLines = 0
        return $0
    }(UILabel())

    var viewModel: MatchingGuestCellViewModel? {
        didSet {
            self.myGuestCardView.viewModel = viewModel?.myGuestCardViewModel
            self.loveMentLabel.text = viewModel?.loveMent
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }

    private func setUI() {
        self.contentView.addSubviews(myGuestCardView, loveMentView, dialogIconImageView)

        self.loveMentView.addSubview(loveMentLabel)
        self.myGuestCardView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
        self.dialogIconImageView.snp.makeConstraints { make in
            make.trailing.equalTo(self.loveMentView).inset(32)
            make.bottom.equalTo(self.loveMentView.snp.top)
        }
        self.loveMentView.snp.makeConstraints { make in
            make.top.equalTo(myGuestCardView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        self.loveMentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview().offset(33)
            make.trailing.equalToSuperview().inset(31)
            make.bottom.equalToSuperview()
        }
    }
}
