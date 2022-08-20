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
    var questionID: Int
    var question: String
    var answer1: String
    var answer2: String

    enum CodingKeys: String, CodingKey {
        case questionID = "questionId"
        case question
        case answer1
        case answer2
    }
}
