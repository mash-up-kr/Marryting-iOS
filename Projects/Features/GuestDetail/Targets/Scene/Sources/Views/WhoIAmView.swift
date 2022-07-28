//
//  WhoIAmView.swift
//  GuestDetailScene
//
//  Created by Woody on 2022/07/21.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import DesignSystem
import UIKit

struct WhoIAmViewModel: ContainViewModel {
    var fightAnswer: String
    var communicationAnswer: String
    var dateAnswer: String
}

final class WhoIAmView: UIView, IntroductionContainerViewProtocol {
    private let fightStackView: UIStackView = {
        let v = UIStackView()
        v.axis = .horizontal
        v.spacing = 4
        v.alignment = .firstBaseline
        v.distribution = .fillProportionally
        return v
    }()

    private let fightDescriptionLabel: UILabel = {
        $0.font = UIFont.notosanskr(weight: .regular, size: ._20)
        $0.textColor = Pallete.Light.grey600.color
        $0.text = "싸울 땐"
        return $0
    }(UILabel())

    private let fightLabel: UILabel = {
        $0.font = .h4()
        $0.textColor = Pallete.Light.grey800.color
        return $0
    }(UILabel())

    private let fightLineView: UIView = {
        $0.backgroundColor = Pallete.Light.grey800.color
        return $0
    }(UIView())

    private let communicationStackView: UIStackView = {
        let v = UIStackView()
        v.axis = .horizontal
        v.spacing = 4
        v.alignment = .firstBaseline
        v.distribution = .fillProportionally
        return v
    }()

    private let communicationDescriptionLabel: UILabel = {
        $0.font = UIFont.notosanskr(weight: .regular, size: ._20)
        $0.textColor = Pallete.Light.grey600.color
        $0.text = "연락은"
        return $0
    }(UILabel())

    private let communicationLabel: UILabel = {
        $0.font = .h4()
        $0.textColor = Pallete.Light.grey800.color
        return $0
    }(UILabel())

    private let communicationLineView: UIView = {
        $0.backgroundColor = Pallete.Light.grey800.color
        return $0
    }(UIView())

    private let dateStackView: UIStackView = {
        let v = UIStackView()
        v.axis = .horizontal
        v.spacing = 4
        v.alignment = .firstBaseline
        v.distribution = .fillProportionally
        return v
    }()

    private let dateDesicrptionLabel: UILabel = {
        $0.font = UIFont.notosanskr(weight: .regular, size: ._20)
        $0.textColor = Pallete.Light.grey600.color
        $0.text = "를 하고 싶어요"
        return $0
    }(UILabel())

    private let dateLabel: UILabel = {
        $0.font = .h4()
        $0.textColor = Pallete.Light.grey800.color
        return $0
    }(UILabel())

    private let dateLineView: UIView = {
        $0.backgroundColor = Pallete.Light.grey800.color
        return $0
    }(UIView())

    var viewModel: ContainViewModel? {
        didSet {
            guard let viewModel = viewModel as? WhoIAmViewModel else { return }
            self.fightLabel.text = viewModel.fightAnswer
            self.communicationLabel.text = viewModel.communicationAnswer
            self.dateLabel.text = viewModel.dateAnswer
            [self.fightLabel, self.communicationLabel, self.dateLabel].forEach {
                $0.sizeToFit()
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
        self.addSubviews(self.fightStackView, self.communicationStackView, self.dateStackView)
        self.addSubviews(self.fightLineView, self.communicationLineView, self.dateLineView)
        self.fightStackView.addArrangedSubviews(self.fightDescriptionLabel, self.fightLabel)
        self.communicationStackView.addArrangedSubviews(self.communicationDescriptionLabel, self.communicationLabel)
        self.dateStackView.addArrangedSubviews(self.dateLabel, self.dateDesicrptionLabel)

        self.fightStackView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.trailing.greaterThanOrEqualTo(0).priority(.low)
        }
        self.communicationStackView.snp.makeConstraints { make in
            make.top.equalTo(self.fightStackView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.greaterThanOrEqualTo(0).priority(.low)
        }
        self.dateStackView.snp.makeConstraints { make in
            make.top.equalTo(self.communicationStackView.snp.bottom).offset(8)
            make.leading.bottom.equalToSuperview()
            make.trailing.greaterThanOrEqualTo(0).priority(.low)
        }

        self.fightLineView.snp.makeConstraints { make in
            make.top.equalTo(self.fightLabel.snp.bottom)
            make.leading.trailing.equalTo(self.fightLabel)
            make.height.equalTo(1)
        }
        self.communicationLineView.snp.makeConstraints { make in
            make.top.equalTo(self.communicationLabel.snp.bottom)
            make.leading.trailing.equalTo(self.communicationLabel)
            make.height.equalTo(1)
        }
        self.dateLineView.snp.makeConstraints { make in
            make.top.equalTo(self.dateLabel.snp.bottom)
            make.leading.trailing.equalTo(self.dateLabel)
            make.height.equalTo(1)
        }

    }
}
