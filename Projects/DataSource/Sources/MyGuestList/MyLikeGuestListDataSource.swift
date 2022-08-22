//
//  MyLikeGuestListDataSource.swift
//  DataSource
//
//  Created by Woody on 2022/07/19.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Network

public protocol MyGuestListDataSourceProtocol {
    func getMyLikeGuestList(request: GetMyLikeGuestListRequest) async throws -> GetMyLikeGuestListResponse
    func getMatchingGuestList(request: GetMatchingGuestListRequest) async throws -> GetMatchingGuestListResponse
}

public final class MyGuestListDataSource: MyGuestListDataSourceProtocol {


    private let network: NetworkProtocol

    public init(network: NetworkProtocol = Network(session: .shared)) {
        self.network = network
    }

    public func getMyLikeGuestList(request: GetMyLikeGuestListRequest) async throws -> GetMyLikeGuestListResponse {
        try await network.send(request)
    }

    public func getMatchingGuestList(request: GetMatchingGuestListRequest) async throws -> GetMatchingGuestListResponse {
        print(request.header)
        return try await network.send(request)
    }
}
