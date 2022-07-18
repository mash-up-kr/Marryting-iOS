//
//  MyLikeGuestCollectionViewCell.swift
//  MyGuestListScene
//
//  Created by Woody on 2022/07/18.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import DesignSystem
import UIKit

struct MyLikeGuestCellViewModel {
    var myGuestCardViewModel: MyGuestCardViewModel
}

final class MyLikeGuestCollectionViewCell: UICollectionViewCell {

    private let myGuestCardView: MyGuestCardView = {
        return $0
    }(MyGuestCardView())

    var viewModel: MyLikeGuestCellViewModel? {
        didSet {
            self.myGuestCardView.viewModel = viewModel?.myGuestCardViewModel
            self.contentView.layoutIfNeeded()
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
        self.contentView.addSubview(myGuestCardView)

        self.myGuestCardView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
