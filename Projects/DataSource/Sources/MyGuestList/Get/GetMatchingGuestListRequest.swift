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

    public var endpoint: String = "/api/v1/like/matching-profiles"

    public var method: HTTPMethod = .get

    public var header: HTTPHeader = [:]

    private let authorizationKey: String = "Authorization"

    public init(_ token: String) {
        header[authorizationKey] = "Bearer" + " " + token
    }
}


