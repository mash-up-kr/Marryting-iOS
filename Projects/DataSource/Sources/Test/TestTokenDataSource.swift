//
//  TestTokenDataSource.swift
//  DataSource
//
//  Created by Woody on 2022/08/07.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Network

public protocol TestTokenDataSourceProtocol {
    func getTestToken(request: GetTestTokenRequest) async throws -> GetTestTokenResponse
}

public final class TestTokenDataSource: TestTokenDataSourceProtocol {

    private let network: NetworkProtocol

    public init(network: NetworkProtocol = Network(session: .shared)) {
        self.network = network
    }

    public func getTestToken(request: GetTestTokenRequest) async throws -> GetTestTokenResponse {
        return try await network.send(request)
    }

}
