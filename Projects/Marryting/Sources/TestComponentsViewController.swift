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

    private lazy var rightArrowButton: RightArrowButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.title = "Next"
        $0.enable = true
        return $0
    }(RightArrowButton())
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    private func layout() {
        
        view.addSubview(rightArrowButton)
        
        NSLayoutConstraint.activate([
            rightArrowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rightArrowButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
}
