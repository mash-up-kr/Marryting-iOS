//
//  GetGuestDetailResponse.swift
//  DataSource
//
//  Created by Woody on 2022/08/12.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Models

public typealias GetGuestDetailResponse = BaseArrayResponse<GetGuestDetailResponseBody>

public struct GetGuestDetailResponseBody: Response {
    public let profileID: Int
    public let profileName: String
    public let age: Int
    public let address, career: String
    public let keywords: [GetGuestDetailKeywordResponseBody]
    public let answers: [GuestDetailAnswerResponseBody]
    public let pictures: [String]

    enum CodingKeys: String, CodingKey {
        case profileID = "profileId"
        case profileName
        case age
        case address
        case career
        case keywords
        case answers
        case pictures
    }
}

public struct GetGuestDetailKeywordResponseBody: Response {
    public let keywordID: Int
    public let keyword: String

    enum CodingKeys: String, CodingKey {
        case keywordID = "keywordId"
        case keyword = "keyword"
    }
}

public struct GuestDetailAnswerResponseBody: Response {
    public let answer: String
    public let questionID: Int

    enum CodingKeys: String, CodingKey {
        case answer
        case questionID = "questionId"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        answer = (try? values.decode(String.self, forKey: .answer)) ?? ""
        questionID = (try? values.decode(Int.self, forKey: .questionID)) ?? -1
    }
}
