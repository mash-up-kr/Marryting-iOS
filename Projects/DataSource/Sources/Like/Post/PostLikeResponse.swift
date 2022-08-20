//
//  PostLikeResponse.swift
//  DataSource
//
//  Created by 박건우 on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Models

public typealias PostLikeResponse = BaseResponse<PostLikeResponseBody>

public struct PostLikeResponseBody: Codable, Response {
    public let isMatch: Bool
    public let message: String
    public let receiverProfileId: Int
    public let senderProfileId: Int
}
