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
    case authCode
    
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
        case .authCode:
            return "인증코드"
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
        case .authCode:
            return "ex) SD2K02"
        }
    }
    
    public var tag: Int {
        switch self {
        case .name:
            return 1
        case .gender:
            return 2
        case .birth:
            return 3
        case .address:
            return 4
        case .job:
            return 5
        case .authCode:
            return 6
        }
    }
}
