//
//  GetTestToken.swift
//  DataSource
//
//  Created by Woody on 2022/08/07.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public struct GetTestTokenRequest: Request {

    public typealias Body = EmptyRequestBody

    public typealias Output = GetTestTokenResponse

    public var endpoint: String = "/api/v1/token"

    public var method: HTTPMethod = .get

    public init(id: Int) {
        endpoint.append("/\(id)")
    }

}
