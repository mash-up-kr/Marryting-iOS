//
//  PostLoginRequest.swift
//  DataSource
//
//  Created by Woody on 2022/07/17.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public struct PostLoginRequest: Request {

    public typealias Body = PostLoginRequestBody

    public typealias Output = PostLoginResponse

    public var endpoint: String = "/api/v1/users/login"

    public var method: HTTPMethod = .post

    public var body: PostLoginRequestBody?

    public init(body: Body) {
        self.body = body
    }
}

public struct PostLoginRequestBody: RequestBody {
    public var oauthType: String
    public var thirdPartyToken: String

    public init(
        oauthType: String,
        thirdPartyToken: String
    ) {
        self.oauthType = oauthType
        self.thirdPartyToken = thirdPartyToken
    }
}
