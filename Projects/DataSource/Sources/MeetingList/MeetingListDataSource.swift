//
//  MeetingListDataSource.swift
//  DataSource
//
//  Created by Woody on 2022/08/13.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Network

public protocol MeetingListDataSourceProtocol {
    func getMeetingList(request: GetMeetingListRequest) async throws -> GetMeetingListResponse
}

public final class MeetingListDataSource: MeetingListDataSourceProtocol {

    private let network: NetworkProtocol

    public init(network: NetworkProtocol = Network(session: .shared)) {
        self.network = network
    }

    public func getMeetingList(request: GetMeetingListRequest) async throws -> GetMeetingListResponse {
        return try await network.send(request)
    }
}
