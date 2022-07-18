//
//  PostLoginRequest.swift
//  DataSource
//
//  Created by Woody on 2022/07/17.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public struct PostLoginRequest: Request {

    public typealias Body = EmptyRequestBody

    public typealias Output = PostLoginResponse

    public var endpoint: String = ""

    public var method: HTTPMethod = .get

    public init() { }
}
