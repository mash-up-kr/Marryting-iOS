//
//  UserDataSource.swift
//  DataSource
//
//  Created by Woody on 2022/08/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation
import NetworkProtocol
import Network

public enum LocalStorageKey: String {
    case token
    case localUser
}

public protocol UserLocalDataSoureceProtocol {
    func saveToken(_ token: String, key: LocalStorageKey)
    func readToken(key: LocalStorageKey) -> String?
    func read(key: LocalStorageKey) -> LocalUser?
    func save<T: Codable>(_ data: T, key: LocalStorageKey)
    func removeAll(key: LocalStorageKey)
    func deleteUser(request: DeleteUserRequest) async throws -> DeleteUserResponse
}

public final class UserLocalDataSourece: UserLocalDataSoureceProtocol {

    private let network: NetworkProtocol

    public init(network: NetworkProtocol = Network(session: .shared)) {
        self.network = network
    }

    public func saveToken(_ token: String, key: LocalStorageKey) {
        UserDefaults.standard.set(token, forKey: key.rawValue)
    }

    public func readToken(key: LocalStorageKey) -> String? {
        UserDefaults.standard.string(forKey: key.rawValue)
    }
    
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
    
    public func deleteUser(request: DeleteUserRequest) async throws -> DeleteUserResponse {
        return try await network.send(request)
    }
}
