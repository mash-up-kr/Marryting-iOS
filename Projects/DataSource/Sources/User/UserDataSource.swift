//
//  UserDataSource.swift
//  DataSource
//
//  Created by Woody on 2022/08/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation
import NetworkProtocol

public enum LocalStorageKey: String {
    case token
    case localUser
}

public protocol UserLocalDataSoureceProtocol {
    func read(key: LocalStorageKey) -> LocalUser?
    func save<T: Codable>(_ data: T, key: LocalStorageKey)
    func removeAll(key: LocalStorageKey)
}

public final class UserLocalDataSourece: UserLocalDataSoureceProtocol {

    public init() {}

    public func read(key: LocalStorageKey) -> LocalUser?  {
        do {
            guard let data = UserDefaults.standard.data(forKey: key.rawValue) else {
                return nil
            }
            return try JSONDecoder().decode(LocalUser.self, from: data)
        } catch let error {
            print("Error decoding: \(error)")
            return nil
        }
    }
    public func save<T: Codable>(_ data: T, key: LocalStorageKey) {
        do {
            let data = try JSONEncoder().encode(data)
            UserDefaults.standard.set(data, forKey: key.rawValue)
        } catch let error {
            print("Error encoding: \(error)")
        }
    }

    public func removeAll(key: LocalStorageKey) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}
