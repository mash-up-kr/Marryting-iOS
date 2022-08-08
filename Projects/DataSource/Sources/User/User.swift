//
//  UserDefaults.swift
//  DataSource
//
//  Created by Woody on 2022/08/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

public enum Gender: Codable {
    case male
    case female
}

public struct UserInformation: Codable {
    public var id: Int
    public var name: String
    public var gender: Gender
    public var career: String
    public var birth: Date
    public var age: Int
    public var address: String
    public var pictures: [String]
}

