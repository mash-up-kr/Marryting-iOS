//
//  PostLikeRequest.swift
//  DataSource
//
//  Created by 박건우 on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public struct PostLikeRequest: Request {

    public typealias Body = PostLikeRequestBody

    public typealias Output = PostLikeResponse

    public var endpoint: String = "/api/v1/like"

    public var method: HTTPMethod = .post
    
    public var body: PostLikeRequestBody?
    
    public init(body: Body) {
        self.body = body
    }
}

public struct PostLikeRequestBody: RequestBody {
    
    public var message: String
    
    public var receiverProfileId: Int
    
    public var senderProfileId: Int

    public var weddingId: Int

    public init(
        message: String,
        receiverProfileId: Int,
        senderProfileId: Int,
        weddingId: Int
    ) {
        self.message = message
        self.receiverProfileId = receiverProfileId
        self.senderProfileId = senderProfileId
        self.weddingId = weddingId
    }
}
