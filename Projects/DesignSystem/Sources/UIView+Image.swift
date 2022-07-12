//
//  UIView+Image.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

extension UIView {

    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
