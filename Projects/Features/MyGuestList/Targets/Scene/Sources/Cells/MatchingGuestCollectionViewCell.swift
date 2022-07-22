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
    var dialog: MatchingGuestDialogViewModel
}

final class MatchingGuestCollectionViewCell: UICollectionViewCell {

    private let myGuestCardView: MyGuestCardView = {
        return $0
    }(MyGuestCardView())

    private let dialogIconImageView: UIImageView = {
        $0.image = .create(.ic_trianlge)
        return $0
    }(UIImageView())

    private let dialogView: MatchingGuestDialogView = {
        return $0
    }(MatchingGuestDialogView())

    var viewModel: MatchingGuestCellViewModel? {
        didSet {
            self.myGuestCardView.viewModel = viewModel?.myGuestCardViewModel
            self.dialogView.viewModel = viewModel?.dialog
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
        self.contentView.addSubviews(self.myGuestCardView, self.dialogIconImageView, self.dialogView)

        self.myGuestCardView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
        self.dialogIconImageView.snp.makeConstraints { make in
            make.trailing.equalTo(self.dialogView).inset(32)
            make.bottom.equalTo(self.dialogView.snp.top).offset(3)
        }
        self.dialogView.snp.makeConstraints { make in
            make.top.equalTo(myGuestCardView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
