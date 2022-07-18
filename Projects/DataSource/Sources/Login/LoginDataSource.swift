//
//  LoginDataSource.swift
//  DataSource
//
//  Created by Woody on 2022/07/17.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Network
import NetworkProtocol

public protocol LoginDataSourceProtocol {
    func login(request: PostLoginRequest) async throws -> PostLoginResponse
}

public final class LoginDataSource: LoginDataSourceProtocol {

    private let network: NetworkProtocol

    public init(network: NetworkProtocol = Network(session: .shared)) {
        self.network = network
    }

    public func login(request: PostLoginRequest) async throws -> PostLoginResponse {
        try await network.send(request)
    }
}
