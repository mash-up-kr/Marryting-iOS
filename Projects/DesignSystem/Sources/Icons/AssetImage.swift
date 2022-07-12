//
//  AssetImage.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/12.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

public enum AssetIcons: String {
    case ic_right_arrow_enable_white
    case ic_right_arrow_highlight_green
    case ic_right_arrow_disable
    case icTrash_enable
    case icTrash_highlight

    public var image: UIImage? {
        let bundle = Bundle(identifier: "kr.mash-up.DesignSystem")
        return .init(named: self.rawValue, in: bundle, with: nil)
    }
}
