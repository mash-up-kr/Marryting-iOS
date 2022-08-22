//
//  Answer.swift
//  Models
//
//  Created by Gunoo on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

public struct Answer {
    public var questionID: Int
    public var answer: String

    public init(
        questionID: Int,
        answer: String
    ) {
        self.questionID = questionID
        self.answer = answer
    }
}
