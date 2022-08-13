//
//  GuestDetailDataSource.swift
//  DataSource
//
//  Created by Woody on 2022/08/12.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Network

public protocol GuestDetailDataSourceProtocol {
    func getGuestDetail(request: GetGuestDetailRequest) async throws -> GetGuestDetailResponse
}

public final class GuestDetailDataSource: GuestDetailDataSourceProtocol {

    private let network: NetworkProtocol

    public init(network: NetworkProtocol = Network(session: .shared)) {
        self.network = network
    }

    public func getGuestDetail(request: GetGuestDetailRequest) async throws -> GetGuestDetailResponse {
        try await network.send(request)
    }
}
