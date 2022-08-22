//
//  PostSignUpResponse.swift
//  DataSource
//
//  Created by Woody on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
 
public typealias PostSignUpResponse = BaseResponse<PostSignUpResponseBody>

 // MARK: - DataClass
 public struct PostSignUpResponseBody: Response {
     public let accessToken: String
     public let profileId: String
//     public let profile: PostSignUpProfileResponseBody
 }

 // MARK: - Profile
 public struct PostSignUpProfileResponseBody: Response {
     public let address: String
     public let age: Int
     public let answers: [PostSignUpProfileAnswerResponseBody]
     public let career: String
     public let keywords: [PostSignUpProfileKeywordResponseBody]
     public let pictures: [String]
     public let profileID: Int
     public let profileName: String

     enum CodingKeys: String, CodingKey {
         case address, age, answers, career, keywords, pictures
         case profileID = "profileId"
         case profileName
     }
 }

 public struct PostSignUpProfileAnswerResponseBody: Response {
     public let questionID: Int
     public let answer: String

     enum CodingKeys: String, CodingKey {
         case questionID = "questionId"
         case answer
     }
 }

 // MARK: - Keyword
 public struct PostSignUpProfileKeywordResponseBody: Response {
     public let keywordID: Int
     public let keyword: String

     enum CodingKeys: String, CodingKey {
         case keywordID = "keywordId"
         case keyword
     }
 }
