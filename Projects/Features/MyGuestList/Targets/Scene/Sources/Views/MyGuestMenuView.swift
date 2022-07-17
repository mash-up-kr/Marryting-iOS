//
//  MyGuestMenuView.swift
//  MyGuestListScene
//
//  Created by Woody on 2022/07/18.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import DesignSystem
import SnapKit
import UIKit
import Kingfisher

protocol MyGuestMenuViewDelegate: AnyObject {

    func myLikeButtonDidTap()

    func matchingButtonDidTap()
}

final class MyGuestMenuView: UIView {

    private enum ButtonCase {
        case myLike
        case matching
    }

    private lazy var myLikeButton: UIButton = {
        $0.setTitle("MY LIKE", for: .normal)
        $0.titleLabel?.font = .h3(name: .montserrat)
        $0.setTitleColor(selectedButtonColor, for: .normal)
        $0.addTarget(self, action: #selector(myLikeButtonDidTap), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))

    private lazy var matchingButton: UIButton = {
        $0.setTitle("MATCHING", for: .normal)
        $0.titleLabel?.font = .h3(name: .montserrat)
        $0.setTitleColor(unselectedButtonColor, for: .normal)
        $0.addTarget(self, action: #selector(matchingButtonDidTap), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))

    private let selectedLineView: UIView = {
        $0.backgroundColor = Pallete.Light.grey800.color
        return $0
    }(UIView())

    @objc private func myLikeButtonDidTap() {
        let buttonCase: ButtonCase = .myLike
        self.delegate?.myLikeButtonDidTap()
        self.animateLineView(buttonCase: buttonCase)
        self.animateButtonColor(buttonCase: buttonCase)
    }

    @objc private func matchingButtonDidTap() {
        let buttonCase: ButtonCase = .matching
        self.delegate?.matchingButtonDidTap()
        self.animateLineView(buttonCase: buttonCase)
        self.animateButtonColor(buttonCase: buttonCase)
    }

    private let selectedButtonColor: UIColor? = Pallete.Light.grey800.color

    private let unselectedButtonColor: UIColor? = Pallete.Light.grey300.color

    weak var delegate: MyGuestMenuViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }

    private func setUI() {
        addSubview(myLikeButton)
        addSubview(matchingButton)
        addSubview(selectedLineView)

        self.myLikeButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(32)
        }
        self.matchingButton.snp.makeConstraints { make in
            make.leading.equalTo(self.myLikeButton.snp.trailing).offset(20)
            make.trailing.greaterThanOrEqualTo(self).inset(32).priority(.low)
        }
        self.selectedLineView.snp.makeConstraints { make in
            make.top.equalTo(self.myLikeButton.snp.bottom)
            make.leading.trailing.equalTo(myLikeButton)
            make.bottom.equalToSuperview()
            make.height.equalTo(2)
        }
    }

    private func animateLineView(buttonCase: ButtonCase) {
        let myLikeButtonWidth: CGFloat = self.myLikeButton.bounds.width
        let matchingButtonWidth: CGFloat = self.matchingButton.bounds.width

        let leadingOffset: CGFloat = buttonCase == .myLike ? 0 : myLikeButtonWidth + 20
        let trailingOffset: CGFloat = buttonCase == .myLike ? 0 : matchingButtonWidth + 20

        UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseOut, animations: {
            self.selectedLineView.snp.updateConstraints { make in
                make.leading.equalTo(self.myLikeButton).offset(leadingOffset)
                make.trailing.equalTo(self.myLikeButton).offset(trailingOffset)
            }
            self.layoutIfNeeded()
        }, completion: nil)
    }

    private func animateButtonColor(buttonCase: ButtonCase) {
        switch buttonCase {
        case .myLike:
            myLikeButton.setTitleColor(selectedButtonColor, for: .normal)
            matchingButton.setTitleColor(unselectedButtonColor, for: .normal)
        case .matching:
            myLikeButton.setTitleColor(unselectedButtonColor, for: .normal)
            matchingButton.setTitleColor(selectedButtonColor, for: .normal)
        }
    }
}
