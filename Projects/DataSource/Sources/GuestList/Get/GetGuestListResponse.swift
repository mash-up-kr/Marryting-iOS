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
    public let answers: [GetGuestAnswerResponseBody]
    public let name: String
    public let profileURL: [String]
    public let weddingID: Int
    public let profileID: Int
    public let gender: String

    enum CodingKeys: String, CodingKey {
        case address, age, career, keywords, name, answers, gender
        case profileID = "profileId"
        case profileURL = "pictures"
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

public struct GetGuestAnswerResponseBody: Response {
    public var answer: String
    public var questionId: Int
}
