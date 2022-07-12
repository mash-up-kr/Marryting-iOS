//
//  TestComponentViewController.swift
//  Marryting
//
//  Created by Woody on 2022/07/12.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

import DesignSystem

class TestComponentViewController: UIViewController {

    private let label: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "I love Chicken"
        $0.font = .h1(name: .montserrat)
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
