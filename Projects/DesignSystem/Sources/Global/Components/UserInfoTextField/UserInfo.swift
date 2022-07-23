//
//  UserInfo.swift
//  DesignSystem
//
//  Created by Yoojin Park on 2022/07/23.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

public enum UserInfo {
    case name
    case gender
    case birth
    case address
    case job
    
    var korean: String {
        switch self {
        case .name:
            return "이름"
        case .gender:
            return "성별"
        case .birth:
            return "생년월일"
        case .address:
            return "사는 곳"
        case .job:
            return "직업"
        }
    }
    
    var placeholder: String {
        switch self {
        case .name:
            return "이름을 입력해주세요"
        case .gender:
            return "성별을 선택해주세요"
        case .birth:
            return "생년월일을 선택해주세요"
        case .address:
            return "ex) 서울시 광진구"
        case .job:
            return "ex) IT 기획자"
        }
    }
}
