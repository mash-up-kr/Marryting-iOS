//
//  UserDataSource.swift
//  DataSource
//
//  Created by Woody on 2022/08/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

public protocol UserDataSoureceProtocol {
    var data: UserInformation? { get }

    func save(_ user: UserInformation)

    func removeAll()
}

public final class UserDataSourece: UserDataSoureceProtocol {

    private let key: String = "user_info"

    public var data: UserInformation? {
        return UserDefaults.standard.getCodable(for: key)
    }

    public init() {}

    public func save(_ user: UserInformation) {
        UserDefaults.standard.storeCodable(data, key: key)
    }

    public func removeAll() {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
