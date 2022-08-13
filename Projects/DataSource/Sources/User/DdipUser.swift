//
//  UserDefaults.swift
//  DataSource
//
//  Created by Woody on 2022/08/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation
import Models

public struct DdipUser: Codable {
    public var user: User
    public var token: String
    
    public init(
        _ user: User,
        _ token: String
    ) {
        self.user = user
        self.token = token
    }
}
