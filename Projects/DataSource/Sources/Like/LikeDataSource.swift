//
//  LikeDataSource.swift
//  DataSource
//
//  Created by 박건우 on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Network

public protocol LikeDataSourceProtocol {
    func postLike(request: PostLikeRequest) async throws -> PostLikeResponse
}

public final class LikeDataSource: LikeDataSourceProtocol {

    private let network: NetworkProtocol

    public init(network: NetworkProtocol = Network(session: .shared)) {
        self.network = network
    }
    
    public func postLike(request: PostLikeRequest) async throws -> PostLikeResponse {
        try await network.send(request)
    }
}

