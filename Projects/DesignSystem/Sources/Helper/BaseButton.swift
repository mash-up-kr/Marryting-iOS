//
//  BaseButton.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/14.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

class BaseButton: UIButton, CodeBased {

    override init(frame: CGRect) {
        super.init(frame: frame)

        layout()

        attribute()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func layout() { }

    func attribute() { }

}
