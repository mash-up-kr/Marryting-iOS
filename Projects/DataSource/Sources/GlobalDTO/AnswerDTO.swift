//
//  AnswerDTO.swift
//  DataSource
//
//  Created by Woody on 2022/08/11.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

public struct AnswerDTO: Codable {
    public let answer, questionID: String

    enum CodingKeys: String, CodingKey {
        case answer
        case questionID = "questionId"
    }
}
