//
//  KeywordCollectionViewCell.swift
//  GuestDetailScene
//
//  Created by Woody on 2022/07/22.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import DesignSystem
import UIKit

struct KeywordCellViewModel {
    var keyword: String
}

final class KeywordCollectionViewCell: UICollectionViewCell {
    private let keywordLabel: UILabel = {
        let v = UILabel()
        v.font = .subtitle2()
        v.textColor = Pallete.Light.white.color
        v.textAlignment = .center
        return v
    }()

    var viewModel: KeywordCellViewModel? {
        didSet {
            keywordLabel.text = viewModel?.keyword
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
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.masksToBounds = true
        self.contentView.addSubview(self.keywordLabel)
        self.keywordLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.bottom.equalToSuperview().inset(7)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
}
