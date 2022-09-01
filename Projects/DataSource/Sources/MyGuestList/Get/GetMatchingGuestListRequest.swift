//
//  GetMatchingGuestListRequest.swift
//  DataSource
//
//  Created by Woody on 2022/07/19.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public struct GetMatchingGuestListRequest: Request {

    public typealias Body = EmptyRequestBody

    public typealias Output = GetMatchingGuestListResponse

    public var endpoint: String {
        return "/api/v1/wedding/\(weddingID)/matching-profiles"
    }

    public var method: HTTPMethod = .get

    public var weddingID: Int = 1

    public init(weddingID: Int) {
        self.weddingID = weddingID
    }
}


