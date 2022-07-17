//
//  GuestListDataSource.swift
//  DataSource
//
//  Created by Gunoo on 2022/07/16.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Network

public protocol GuestListDataSourceProtocol {
    func getGuestList(request: GetGuestListRequest) async throws -> GetGuestListResponse
}

public final class GuestListDataSource: GuestListDataSourceProtocol {
    
    private let network: NetworkProtocol
    
    public init(network: NetworkProtocol = Network(session: .shared)) {
        self.network = network
    }
    
    public func getGuestList(request: GetGuestListRequest) async throws -> GetGuestListResponse {
        try await network.send(request)
    }
}
