//
//  DialogView.swift
//  MyGuestListScene
//
//  Created by Woody on 2022/07/19.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import DesignSystem
import UIKit

import Kingfisher
import SnapKit

struct MatchingGuestDialogViewModel {
    var loveMent: String
}

final class MatchingGuestDialogView: UIView {

    lazy var loveMentLabel: UILabel = {
        // TODO: 영어 멘트일경우 체크
        $0.font = .h4()
        $0.numberOfLines = 2
        $0.textColor = Pallete.Light.grey700.color
        return $0
    }(UILabel())

    lazy var imageView: UIImageView = {
        let v = UIImageView(asset: .img_yellow_dongrami)
        return v
    }()

    enum ImageType {
        case blue
        case yello
        
        var imageAsset: UIImage? {
            switch self {
            case .blue:
                return .create(.img_blue_dongrami)
            case .yello:
                return .create(.img_yellow_dongrami)
            }
        }
    }

    var imageType: ImageType? {
        didSet {
            self.imageView.image = imageType?.imageAsset
        }
    }

    var viewModel: MatchingGuestDialogViewModel? {
        didSet {
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
        self.backgroundColor = Pallete.Light.background.color
        self.addSubview(self.loveMentLabel)
        self.addSubview(self.imageView)
        
        self.loveMentLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(33)
            make.trailing.equalToSuperview().inset(98)
        }
        self.imageView.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview()
            make.width.height.equalTo(78)
            make.top.equalToSuperview().offset(30)
        }
    }
}
