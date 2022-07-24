//
//  SelectionBox.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/22.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

import SnapKit

struct AnswerSelectionBoxViewModel {
    var isSelect: Bool
    var answer: String
}

final class AnswerSelectionBox: UIView {
    private lazy var hStackView: UIStackView = {
        let v = UIStackView()
        v.axis = .horizontal
        v.spacing = 8
        v.alignment = .center
        v.distribution = .fill
        return v
    }()

    private lazy var answerLabel: UILabel = {
        $0.font = .body1()
        $0.textColor = Pallete.Light.grey100.color
        return $0
    }(UILabel())

    private lazy var iconImageView: UIImageView = {
        let v = UIImageView(asset: .ic_check_grey)
        return v
    }()

    var viewModel: AnswerSelectionBoxViewModel? {
        didSet {
            answerLabel.text = viewModel?.answer
            isSelect = viewModel?.isSelect ?? false
        }
    }

    var isSelect: Bool = false {
        didSet {
            changeSelection()
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
        self.layer.cornerRadius = 8
        self.layer.borderColor = Pallete.Dark.grey400.color?.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = Pallete.Dark.grey600.color
        self.addSubview(self.hStackView)
        self.hStackView.addArrangedSubviews(self.iconImageView, self.answerLabel)

        self.hStackView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(20)
            make.bottom.trailing.equalToSuperview().inset(20)
        }
        self.iconImageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
    }

    private func changeSelection() {
        let borderColor: UIColor? = isSelect ? Pallete.Dark.subGreen.color : Pallete.Dark.grey400.color
        let backgroundColor: UIColor? = isSelect ? Pallete.Dark.subGreen.color?.withAlphaComponent(0.16) : Pallete.Dark.grey600.color
        let font: UIFont = isSelect ? .h5() : .body1()
        let textColor: UIColor? = isSelect ? Pallete.Dark.grey100.color : Pallete.Dark.white.color
        let iconImage: UIImage? = isSelect ? .create(.ic_check_green) : .create(.ic_check_grey)

        self.answerLabel.textColor = textColor
        self.answerLabel.font = font
        self.layer.borderColor = borderColor?.cgColor
        self.backgroundColor = backgroundColor
        self.iconImageView.image = iconImage

    }
}
