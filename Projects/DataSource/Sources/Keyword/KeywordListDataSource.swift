//
//  KeywordDataSource.swift
//  DataSource
//
//  Created by Woody on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Network

public protocol KeywordListDataSourceProtocol {
    func getKeywords(request: GetKeywordsRequest) async throws -> GetKeywordListResponse
}

public final class KeywordListDataSource: KeywordListDataSourceProtocol {

    private let network: NetworkProtocol

    public init(network: NetworkProtocol = Network(session: .shared)) {
        self.network = network
    }

    public func getKeywords(request: GetKeywordsRequest) async throws -> GetKeywordListResponse {
        try await network.send(request)
    }
}
