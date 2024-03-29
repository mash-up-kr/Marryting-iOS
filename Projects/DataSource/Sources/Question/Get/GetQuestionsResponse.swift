//
//  GetQuestionsResponse.swift
//  DataSource
//
//  Created by Woody on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public typealias GetQuestionsResponse = BaseArrayResponse<GetQuestionResponseBody>

public struct GetQuestionResponseBody: Codable, Response {
    public let questionID: Int
    public let question: String
    public let answer1: String
    public let answer2: String

    enum CodingKeys: String, CodingKey {
        case questionID = "questionId"
        case question
        case answer1
        case answer2
    }
}
