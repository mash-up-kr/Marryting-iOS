//
//  AssetImage.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/12.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

public enum Assets: String {
    case ic_check_black
    case ic_close
    case ic_clover
    case ic_dropdown
    case ic_arrow_back
    case ic_enlarge
    case ic_edit_enable
    case ic_edit_highlight
    case ic_error
    case ic_heart_enable
    case ic_heart_highlight // TODO: 이거 사이즈가 이상하다.
    case ic_main_dark_disable
    case ic_main_dark_enable
    case ic_main_dark_highlight
    case ic_main_light_disable
    case ic_main_light_enable
    case ic_main_light_highlight
    case ic_right_enable
    case ic_right_highlight
    case ic_trash_disable
    case ic_trash_enable
    case ic_trash_highlight
    case ic_main_small_dark_enable
    case ic_main_small_dark_highlight
    case ic_edit
    case ic_heart
    case ic_ring
    case img_bubble
    case img_bubble_back
    case logo
    case btn_apple_login
    case ic_trianlge
    case ic_check_green
    case ic_check_grey

    public var image: UIImage? {
        let bundle = Bundle(identifier: "kr.mash-up.DesignSystem")
        return .init(named: self.rawValue, in: bundle, with: nil)
    }
}
