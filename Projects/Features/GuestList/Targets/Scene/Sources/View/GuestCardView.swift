//
//  GuestCardView.swift
//  GuestList
//
//  Created by Gunoo on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import SnapKit
import DesignSystem
import Kingfisher

struct GuestCardViewModel {
    var id: Int
    var imageUrl: String
    var name: String
    var info: String
    var isLiked: Bool
}

protocol GuestCardViewDelegate: AnyObject {
    func didTapLikeButton(id: Int)
}

final class GuestCardView: UIView {
    
    lazy var profileImageView: UIImageView = {
        let v = UIImageView()
        v.layer.cornerRadius = 16
        v.clipsToBounds = true
        v.backgroundColor = Pallete.Light.background.color
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    lazy var nameLabel: UILabel = {
        let v = UILabel()
        v.font = .h3()
        v.textColor = .white
        return v
    }()
    
    lazy var infoLabel: UILabel = {
        let v = UILabel()
        v.font = .body3()
        v.textColor = Pallete.Light.grey200.color
        return v
    }()
    
    lazy var likeButton: MTButton = {
        let v = MTButton.create(.iconMainLight)
        v.setBackgroundImage(.create(.ic_heart_enable), for: .highlighted)
        v.addTarget(self, action: #selector(likeButtonDidTap), for: .touchUpInside)
        v.addTarget(self, action: #selector(likeButtonDidTouchDown), for: .touchDown)
        return v
    }()
    
    @objc func likeButtonDidTap() {
        guard let viewModel = viewModel else {
            return
        }
        UIView.animate(
            withDuration: 0.05,
            animations: {
                self.likeButton.transform = CGAffineTransform.identity
            }
        )
        delegate?.didTapLikeButton(id: viewModel.id)
    }
    
    @objc func likeButtonDidTouchDown() {
        UIView.animate(
            withDuration: 0.25,
            animations: {
                self.likeButton.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        )
    }
    
    var viewModel: GuestCardViewModel? {
        didSet {
            // TODO: Image KF 사용 로드
            _ = self.profileImageView
            self.nameLabel.text = viewModel?.name ?? ""
            self.infoLabel.text = viewModel?.info ?? ""
            if let urlString = viewModel?.imageUrl,
               let url = URL(string: urlString) {
                self.profileImageView.kf.setImage(with: url)
            }
        }
    }
    
    weak var delegate: GuestCardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUI()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }

    private func setUI() {
        self.layer.cornerRadius = 16
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 4
        
        self.addSubview(self.profileImageView)
        self.addSubview(self.likeButton)
        self.profileImageView.addSubview(self.nameLabel)
        self.profileImageView.addSubview(self.infoLabel)
        
        self.profileImageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(8)
            make.height.equalTo(self.profileImageView.snp.width).multipliedBy(1.33)
            make.bottom.lessThanOrEqualToSuperview().inset(80)
        }
        self.likeButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(16)
            make.top.equalTo(self.profileImageView.snp.bottom).offset(16)
            make.height.width.equalTo(48)
            make.centerX.equalToSuperview()
        }
        self.nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.bottom.equalTo(self.infoLabel.snp.top).offset(2)
        }
        self.infoLabel.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview().inset(24)
        }
        
        self.setProfileImageViewBackgroundGradient()
    }
    
    private func setProfileImageViewBackgroundGradient() {
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
