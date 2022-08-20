//
//  GetWeddingCodeRequest.swift
//  DataSource
//
//  Created by 박건우 on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public struct GetWeddingCodeRequest: Request {

    public typealias Body = EmptyRequestBody

    public typealias Output = GetWeddingCodeResponse

    public var endpoint: String = "/api/v1/wedding"

    public var method: HTTPMethod = .post

    public init(weddingCode: String) {
        endpoint = endpoint + "/\(weddingCode)"
    }
}
