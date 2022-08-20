//
//  WeddingCodeDataSource.swift
//  DataSource
//
//  Created by 박건우 on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Network

public protocol WeddingCodeDataSourceProtocol {
    func getWeddingCodeRequest(request: GetWeddingCodeRequest) async throws -> GetWeddingCodeResponse
}

public final class WeddingCodeDataSource: WeddingCodeDataSourceProtocol {

    private let network: NetworkProtocol

    public init(network: NetworkProtocol = Network(session: .shared)) {
        self.network = network
    }

    public func getWeddingCodeRequest(request: GetWeddingCodeRequest) async throws -> GetWeddingCodeResponse {
        try await network.send(request)
    }
}
