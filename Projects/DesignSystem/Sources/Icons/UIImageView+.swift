//
//  UIImageView+.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/12.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

extension UIImageView {
    
    public convenience init(asset: AssetIcons) {
        self.init(image: asset.image)
    }
}
