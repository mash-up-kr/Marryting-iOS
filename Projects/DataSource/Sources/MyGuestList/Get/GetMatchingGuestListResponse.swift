//
//  GetMatchingGuestListResponse.swift
//  DataSource
//
//  Created by Woody on 2022/07/19.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Models

public typealias GetMatchingGuestListResponse = BaseArrayResponse<GetMatchingGuestResponseBody>


public struct GetMatchingGuestResponseBody: Response {
    public let address: String
    public let age: Int
    public let answers: [GetMatchingGuestQuestionResponseBody]
    public let career: String
    public let gender: String
    public let keywords: [GetMatchingGuestKeywordResponseBody]
    public let name: String
    public let message: String
    public let pictures: [String]
    public let profileID: Int

    enum CodingKeys: String, CodingKey {
        case address, age, answers, career, gender, keywords, message, name, pictures
        case profileID = "profileId"
    }
}

public struct GetMatchingGuestQuestionResponseBody: Response {
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

public struct GetMatchingGuestKeywordResponseBody: Response {
    public let keywordID: Int
    public let keyword: String

    enum CodingKeys: String, CodingKey {
        case keywordID = "keywordId"
        case keyword = "keyword"
    }
}
