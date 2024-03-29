//
//  TestComponentsViewController.swift
//  Marryting
//
//  Created by Woody on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import DesignSystem

final class TestComponentsViewController: UIViewController {

    private lazy var button1: MTButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.title = "NEXT"
        $0.isEnabled = true
        return $0
    }(MTButton.create(.mainDark))

    private lazy var button2: MTButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.title = "NEXT"
        $0.isEnabled = false
        return $0
    }(MTButton.create(.mainDark))

    private lazy var button3: MTButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.title = "BUTTON"
        $0.isEnabled = true
        return $0
    }(MTButton.create(.mainLight))

    private lazy var button4: MTButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.title = "BUTTON"
        $0.isEnabled = false
        return $0
    }(MTButton.create(.mainLight))

    private lazy var button5: MTButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.title = "BUTTON"
        return $0
    }(MTButton.create(.text))

    private lazy var button6: MTButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false

        return $0
    }(MTButton.create(.iconMainLight))

    private lazy var button7: MTButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isEnabled = true
        return $0
    }(MTButton.create(.iconSubDark))

    private lazy var button8: MTButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(MTButton.create(.iconSub1Light))

    private lazy var button9: MTButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false

        return $0
    }(MTButton.create(.iconSub2Light))

    private lazy var stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alignment = .center
        $0.axis = .horizontal
        $0.distribution = .fill
        $0.spacing = 10
        return $0
    }(UIStackView())

    private lazy var label1: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .h2(name: .montserrat)
        $0.text = "폰트테스트"
        return $0
    }(UILabel())

    private lazy var label2: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .subtitle1(name: .montserrat)
        $0.text = "폰트테스트"
        return $0
    }(UILabel())

    private lazy var label3: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .body1(name: .montserrat)
        $0.text = "폰트테스트"
        return $0
    }(UILabel())

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
    }

    private func layout() {

        view.addSubview(button1)

        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(button2)

        NSLayoutConstraint.activate([
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 16),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(button3)

        NSLayoutConstraint.activate([
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 16),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(button4)

        NSLayoutConstraint.activate([
            button4.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 16),
            button4.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(button5)

        NSLayoutConstraint.activate([
            button5.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: 16),
            button5.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(button6)

        NSLayoutConstraint.activate([
            button6.topAnchor.constraint(equalTo: button5.bottomAnchor, constant: 16),
            button6.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(button7)

        NSLayoutConstraint.activate([
            button7.topAnchor.constraint(equalTo: button6.bottomAnchor, constant: 16),
            button7.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(button8)

        NSLayoutConstraint.activate([
            button8.topAnchor.constraint(equalTo: button7.bottomAnchor, constant: 16),
            button8.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(button9)

        NSLayoutConstraint.activate([
            button9.topAnchor.constraint(equalTo: button8.bottomAnchor, constant: 16),
            button9.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        view.addSubview(stackView)

        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(label3)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: button9.bottomAnchor, constant: 16),
            stackView.centerXAnchor.constraint(equalTo: button9.centerXAnchor)
        ])
    }

}
