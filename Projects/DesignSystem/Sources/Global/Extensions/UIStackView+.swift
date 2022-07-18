//
//  UIStackView+.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/18.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

public extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for v in views {
            self.addArrangedSubview(v)
        }
    }
}
