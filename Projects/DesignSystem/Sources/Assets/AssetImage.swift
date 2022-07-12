//
//  AssetImage.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/12.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

public enum Assets: String {
    case ic_right_arrow_enable_white
    case ic_right_arrow_enable_black
    case ic_right_arrow_highlight_green
    case ic_right_arrow_highlight_red
    case ic_right_arrow_disable
    case ic_trash_enable
    case ic_trash_highlight
    case ic_edit
    case ic_heart_black
    case ic_heart_red
    case ic_left_arrow_enable
    case ic_left_arrow_highlight
    case ic_clover
    case ic_check_black
    case ic_close
    case ic_dropdown
    case ic_error

    public var image: UIImage? {
        let bundle = Bundle(identifier: "kr.mash-up.DesignSystem")
        return .init(named: self.rawValue, in: bundle, with: nil)
    }
}
