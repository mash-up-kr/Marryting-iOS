//
//  GetMyLikeGuestListRequest.swift
//  DataSource
//
//  Created by Woody on 2022/07/19.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public struct GetMyLikeGuestListRequest: Request {

    public typealias Body = EmptyRequestBody

    public typealias Output = GetMyLikeGuestListResponse

    public var endpoint: String = ""

    public var method: HTTPMethod = .get

    public init() {}
}

