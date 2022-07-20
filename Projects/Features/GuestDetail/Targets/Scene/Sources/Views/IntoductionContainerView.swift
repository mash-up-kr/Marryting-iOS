//
//  IntoductionContainerView.swift
//  GuestDetailScene
//
//  Created by Woody on 2022/07/21.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import DesignSystem
import UIKit

import SnapKit

protocol IntroductionContainerViewProtocol: UIView {
    var viewModel: ContainViewModel? { get set }
}

final class IntroductionContainerView: UIView {
    private let lineView: UIView = {
        let v = UIView()
        v.backgroundColor = Pallete.Light.grey100.color
        return v
    }()

    private let titleLabel: UILabel = {
        let v = UILabel()
        v.font = .subtitle3(name: .montserrat)
        v.textColor = Pallete.Light.grey700.color
        return v
    }()

    var containView: IntroductionContainerViewProtocol?

    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }

    var viewModel: ContainViewModel? {
        didSet {
            self.containView?.viewModel = viewModel
        }
    }

    convenience init(containView: IntroductionContainerViewProtocol) {
        self.init()
        self.containView = containView
        setUI()
    }

    private func setUI() {
        self.backgroundColor = .clear
        self.addSubview(self.lineView)
        self.addSubview(self.titleLabel)

        self.lineView.snp.makeConstraints { make in
            make.leading.equalTo(self).offset(40)
            make.trailing.top.equalToSuperview()
            make.height.equalTo(1)
        }
        self.titleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(lineView)
            make.top.equalTo(lineView.snp.bottom).offset(9)
        }

        if let containView = containView {
            self.addSubview(containView)
            containView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(40)
                make.trailing.equalToSuperview().inset(40)
                make.top.equalTo(titleLabel.snp.bottom).offset(17)
                make.bottom.equalToSuperview().inset(70)
            }
        }
    }
}
