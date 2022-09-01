//
//  UserProfileImageCollectionViewCell.swift
//  GuestDetailRoutingProtocol
//
//  Created by Woody on 2022/07/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

struct UserProfileImagewCellViewModel {
    var userProfileImageViewModel: UserProfileImageViewModel
}

final class UserProfileImageCollectionViewCell: UICollectionViewCell {

    private lazy var userImageView: UserProfileImageView = {
        let v = UserProfileImageView()
        return v
    }()

    var viewModel: UserProfileImagewCellViewModel? {
        didSet {
            userImageView.viewModel = viewModel?.userProfileImageViewModel
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
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.16
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 8
        self.layer.masksToBounds = false

        self.contentView.addSubview(userImageView)

        userImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
