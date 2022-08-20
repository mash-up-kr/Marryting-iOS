//
//  GetGuestListResponse.swift
//  DataSource
//
//  Created by Gunoo on 2022/07/16.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Models

public typealias GetGuestListResponse = BaseArrayResponse<GetGuestResponseBody>

public struct GetGuestResponseBody: Response {
    public let address: String
    public let age: Int
    public let career: String
    public let keywords: [GetGuestKeywordResponseBody]
    public let name: String
    public let profileURL: [String]
    public let weddingID: Int
    public let profileID: Int

    enum CodingKeys: String, CodingKey {
        case address, age, career, keywords, name
        case profileID = "profileId"
        case profileURL = "profileUrl"
        case weddingID = "weddingId"
    }
}

public struct GetGuestKeywordResponseBody: Response {
    public var keywordID: Int
    public var keyword: String

    enum CodingKeys: String, CodingKey {
        case keywordID = "keywordId"
        case keyword = "keyword"
    }
}
