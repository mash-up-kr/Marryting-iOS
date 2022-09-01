//
//  Formatter.swift
//  ProfileRegister
//
//  Created by Woody on 2022/08/24.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

struct Formatter {
    static let dateFormatter: DateFormatter = {
        let v = DateFormatter()
        v.dateFormat = "yyyy-MM-dd"
        return v
    }()

    static let koreanDateFormatter: DateFormatter = {
        let v = DateFormatter()
        v.dateFormat = "yyyy년 MM월 dd일"
        return v
    }()
}
