//
//  GetKeywordRequest.swift
//  DataSource
//
//  Created by Woody on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public struct GetKeywordsRequest: Request {

    public typealias Body = EmptyRequestBody

    public typealias Output = GetKeywordListResponse

    public var endpoint: String = "/api/v1/keywords"

    public var method: HTTPMethod = .get

    public init() {}
}
