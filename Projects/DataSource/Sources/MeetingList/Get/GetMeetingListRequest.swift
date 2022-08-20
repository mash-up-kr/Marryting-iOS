//
//  GetMeetingListRequest.swift
//  DataSource
//
//  Created by Woody on 2022/08/13.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public struct GetMeetingListRequest: Request {

    public typealias Body = EmptyRequestBody

    public typealias Output = GetMeetingListResponse

    public var endpoint: String = "/api/v1/wedding/guest/list"

    public var method: HTTPMethod = .get

    public var header: HTTPHeader = [:]

    public init(token: String) {
        header[authorizationKey] = "Bearer" + " " + token
    }

    private let authorizationKey: String = "Authorization"
}
