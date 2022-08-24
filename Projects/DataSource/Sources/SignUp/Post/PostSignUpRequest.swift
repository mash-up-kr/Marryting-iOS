//
//  PostSignUpRequest.swift
//  DataSource
//
//  Created by Woody on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public struct PostSignUpRequest: Request {

    public typealias Body = PostSignUpRequestBody

    public typealias Output = PostSignUpResponse

    public var endpoint: String = "/api/v1/users/signup"

    public var method: HTTPMethod = .post
    
    public var body: PostSignUpRequestBody?
    
    public init(body: PostSignUpRequestBody) {
        self.body = body
    }
}

public struct PostSignUpRequestBody: RequestBody {
    
    public var oauthType: String
    
    public var profile: Profile
    
    public var thirdPartyToken: String
    
    public struct Profile: Codable {
        
        public var address: String
        
        public var answers: [Answer]
        
        public var birth: String
        
        public var career: String
        
        public var gender: String
        
        public var keywords: [Keyword]
        
        public var name: String
        
        public var pictures: [String]
        
        public init(
            address: String,
            answers: [Answer],
            birth: String,
            career: String,
            gender: String,
            keywords: [Keyword],
            name: String,
            pictures: [String]
        ) {
            self.address = address
            self.answers = answers
            self.birth = birth
            self.career = career
            self.gender = gender
            self.keywords = keywords
            self.name = name
            self.pictures = pictures
        }
        
        public struct Answer: Codable {
            
            public var answer: String
            
            public var questionId: Int
            
            public init(answer: String, questionId: Int) {
                self.answer = answer
                self.questionId = questionId
            }
        }
        
        public struct Keyword: Codable {
            
            public var keyword: String
            
            public var keywordId: Int
            
            public init(keyword: String, keywordId: Int) {
                self.keyword = keyword
                self.keywordId = keywordId
            }
        }
    }
    
    public init(
        oauthType: String,
        profile: Profile,
        thirdPartyToken: String
    ) {
        self.oauthType = oauthType
        self.profile = profile
        self.thirdPartyToken = thirdPartyToken
    }
}
