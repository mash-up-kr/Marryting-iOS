//
//  MyGuestCardView.swift
//  MyGuestListScene
//
//  Created by Woody on 2022/07/18.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import DesignSystem
import UIKit

import Kingfisher
import SnapKit

struct MyGuestCardViewModel {
    var id: Int
    var imageUrl: String
    var name: String
    var age: Int
    var address: String
    var career: String
    var isLiked: Bool
}

final class MyGuestCardView: UIView {

    private let profileImageView: UIImageView = {
        $0.backgroundColor = Pallete.Light.background.color
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())

    private let nameLabel: UILabel = {
        // TODO: 영어이름일 경우?
        $0.font = .h2()
        $0.textColor = Pallete.Light.white.color
        return $0
    }(UILabel())

    private let ageLabel: UILabel = {
        $0.font = .h2(name: .montserrat)
        $0.textColor = Pallete.Light.grey300.color
        return $0
    }(UILabel())

    private let addressStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .center
        $0.spacing = 0
        return $0
    }(UIStackView())

    private let addressIconImageView: UIImageView = {
        $0.image = .create(.ic_clover)
        return $0
    }(UIImageView())

    private let addressLabel: UILabel = {
        $0.font = .h5()
        $0.textColor = Pallete.Light.background.color
        return $0
    }(UILabel())

    private let addressDescriptionLabel: UILabel = {
        $0.font = .subtitle2()
        $0.textColor = Pallete.Light.grey200.color
        $0.text = "에 살아요"
        return $0
    }(UILabel())

    private let careerStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.alignment = .center
        $0.spacing = 0
        return $0
    }(UIStackView())

    private let careerIconImageView: UIImageView = {
        $0.image = .create(.ic_clover)
        return $0
    }(UIImageView())

    private let careerLabel: UILabel = {
        $0.font = .h5()
        $0.textColor = Pallete.Light.background.color
        return $0
    }(UILabel())

    private let careerDescriptionLabel: UILabel = {
        $0.font = .subtitle2()
        $0.textColor = Pallete.Light.grey200.color
        $0.text = "로 일해요"
        return $0
    }(UILabel())

    var viewModel: MyGuestCardViewModel? {
        didSet {
            self.nameLabel.text = viewModel?.name ?? ""
            self.addressLabel.text = viewModel?.address ?? ""
            self.careerLabel.text = viewModel?.career ?? ""
            if let age = viewModel?.age {
                self.ageLabel.text = "\(age)"
            }
            if let urlString = viewModel?.imageUrl,
               let url = URL(string: urlString) {
                self.profileImageView.kf.setImage(with: url)
                self.setProfileImageViewBackgroundGradient()
            }
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
        self.addSubviews(self.profileImageView, self.nameLabel, self.ageLabel)
        self.addSubviews(self.addressStackView, self.careerStackView)

        self.addressStackView.addArrangedSubviews(self.addressIconImageView, self.addressLabel, self.addressDescriptionLabel)
        self.careerStackView.addArrangedSubviews(self.careerIconImageView, self.careerLabel, self.careerDescriptionLabel)

        self.profileImageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            let width: CGFloat = UIScreen.main.bounds.width
            let height: CGFloat = width * 1.33
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
        self.nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
        }
        self.ageLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing).offset(4)
            make.bottom.equalTo(nameLabel)
        }
        self.addressStackView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalTo(nameLabel)
        }
        self.addressIconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(26)
        }
        self.careerStackView.snp.makeConstraints { make in
            make.top.equalTo(addressStackView.snp.bottom).offset(4)
            make.leading.equalTo(addressStackView)
            make.bottom.equalToSuperview().inset(32)
        }
    }

    private func setProfileImageViewBackgroundGradient() {
        self.profileImageView.layer.sublayers = nil
        self.layoutIfNeeded()
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.locations = [0.0 , 1.0]
        gradient.colors = [UIColor.black.withAlphaComponent(0).cgColor, UIColor.black.withAlphaComponent(0.7).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = .init(x: 0, y: 0, width: self.profileImageView.frame.width, height: self.profileImageView.frame.height)
        self.profileImageView.layer.insertSublayer(gradient, at:0)
    }
}
