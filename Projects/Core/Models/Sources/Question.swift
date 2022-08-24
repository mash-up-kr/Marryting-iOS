//
//  Question.swift
//  Models
//
//  Created by 박건우 on 2022/08/23.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

public struct Question {
    /// 질문지 ID
    public var questionId: Int
    /// 질문
    public var question: String
    /// 첫번째 선택지
    public var answer1: String
    /// 두번째 선택지
    public var answer2: String
    
    public init(
        questionId: Int,
        question: String,
        answer1: String,
        answer2: String
    ) {
        self.questionId = questionId
        self.question = question
        self.answer1 = answer1
        self.answer2 = answer2
    }
}
