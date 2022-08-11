//
//  GetMatchingGuestListResponse.swift
//  DataSource
//
//  Created by Woody on 2022/07/19.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Models

public typealias GetMatchingGuestListResponse = BaseArrayResponse<GetMatchingGuestListDTO>


public struct GetMatchingGuestListDTO: Codable, Response {
    public let address: String
    public let age: Int
    public let answers: [AnswerDTO]
    public let career: String
    public let gender: String
    public let keywords: [KeywordDTO]
    public let name: String
    public let message: String
    public let pictures: [String]
    public let profileID: Int

    enum CodingKeys: String, CodingKey {
        case address, age, answers, career, gender, keywords, message, name, pictures
        case profileID = "profileId"
    }
}

public extension MatchedGuest {
    
    init(_ dto: GetMatchingGuestListDTO) {
        let user = User(id: dto.profileID,
                        name: dto.name,
                        gender: dto.gender == "MALE" ? .male : .female,
                        career: dto.career,
                        birth: .init(),
                        age: dto.age,
                        address: dto.address,
                        pictures: dto.pictures,
                        answers: dto.answers.map { $0.answer },
                        keyword: dto.keywords.map { $0.keyword })
        self.init(guest: Guest(user: user, isLiked: true), loveMent: dto.message)
    }
}
