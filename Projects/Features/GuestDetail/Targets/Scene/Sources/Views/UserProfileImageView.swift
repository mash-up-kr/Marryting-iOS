//
//  UserProfileView.swift
//  GuestDetailRoutingProtocol
//
//  Created by Woody on 2022/07/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import DesignSystem
import UIKit

import Kingfisher
import SnapKit

struct UserProfileImageViewModel {
    var imageUrl: String
}

final class UserProfileImageView: UIView {

    lazy var profileImageView: UIImageView = {
        let v = UIImageView()
        v.backgroundColor = Pallete.Light.background.color
        v.contentMode = .scaleAspectFill
        return v
    }()

    var viewModel: UserProfileImageViewModel? {
        didSet {
            // TODO: Image KF 사용 로드
            _ = self.profileImageView
            if let urlString = viewModel?.imageUrl,
               let url = URL(string: urlString) {
                self.profileImageView.kf.setImage(with: url)
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUI()
    }

    private func setUI() {
        self.addSubview(self.profileImageView)

        self.profileImageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
            make.height.equalTo(self.profileImageView.snp.width).multipliedBy(1.33)
        }
    }

}
