//
//  Answer.swift
//  Models
//
//  Created by Gunoo on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

public struct Answer {
    
    public var questionId: String
    
    public var answer: String
    
    public init(
        questionId: String,
        answer: String
    ) {
        self.questionId = questionId
        self.answer = answer
    }
}
