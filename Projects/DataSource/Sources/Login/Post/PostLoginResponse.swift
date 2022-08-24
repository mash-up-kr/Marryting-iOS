//
//  PostLoginResponse.swift
//  DataSource
//
//  Created by Woody on 2022/07/17.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public typealias PostLoginResponse = BaseResponse<PostLoginResponseBody>

// MARK: - DataClass
public struct PostLoginResponseBody: Response {
    public let accessToken: String
    public let profile: PostLoginProfileResponseBody
}

// MARK: - Profile
public struct PostLoginProfileResponseBody: Response {
    public let address: String
    public let age: Int
    public let answers: [PostLoginProfileAnswerResponseBody]
    public let career: String
    public let keywords: [PostLoginProfileKeywordResponseBody]
    public let pictures: [String]
    public let profileID: Int
    public let profileName: String
    public let gender: String

    enum CodingKeys: String, CodingKey {
        case address, age, answers, career, keywords, pictures
        case profileID = "profileId"
        case profileName
        case gender
    }
}

public struct PostLoginProfileAnswerResponseBody: Response {
    public let questionID: Int
    public let answer: String

    enum CodingKeys: String, CodingKey {
        case questionID = "questionId"
        case answer
    }
}

// MARK: - Keyword
public struct PostLoginProfileKeywordResponseBody: Response {
    public let keywordID: Int
    public let keyword: String

    enum CodingKeys: String, CodingKey {
        case keywordID = "keywordId"
        case keyword
    }
}
