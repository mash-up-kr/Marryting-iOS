//
//  AssetImage.swift
//  DesignSystem
//
//  Created by Woody on 2022/07/12.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit

public enum Assets: String {
    case btn_dropImage_button
    case ic_check_black
    case ic_close
    case ic_clover
    case ic_dropdown
    case ic_dropdown_gray
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
    case ic_trianlge
    case ic_check_green
    case ic_check_grey
    case ic_addImage
    case ic_heart_dark
    case btn_apple_button
    case img_login
    case ic_symbols_work
    case ic_sharp_place
    case img_blue_dongrami
    case img_yellow_dongrami
    case ic_sharp_place_grey100
    case ic_symbols_work_grey100
    case img_header_code
    case ic_matching_list_empty_view
    case ic_my_like_list_empty_view
    
    public var image: UIImage? {
        let bundle = Bundle(identifier: "kr.mash-up.DesignSystem")
        return .init(named: self.rawValue, in: bundle, with: nil)
    }
}
