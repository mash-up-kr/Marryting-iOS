//
//  UserDataSource.swift
//  DataSource
//
//  Created by Woody on 2022/08/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation
import Models

public protocol UserDataSoureceProtocol {
    var data: User? { get }

    func save(_ user: User)

    func removeAll()
}

public final class UserDataSourece: UserDataSoureceProtocol {

    private let key: String = "userInfo"

    public var data: User? {
        return UserDefaults.standard.getCodable(for: key)
    }

    public init() {}

    public func save(_ user: User) {
        UserDefaults.standard.storeCodable(user, key: key)
    }

    public func removeAll() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
