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

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        answer = (try? values.decode(String.self, forKey: .answer)) ?? ""
        questionID = (try? values.decode(String.self, forKey: .questionID)) ?? ""
    }
}
