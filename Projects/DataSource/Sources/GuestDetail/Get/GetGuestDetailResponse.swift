//
//  GetGuestDetailResponse.swift
//  DataSource
//
//  Created by Woody on 2022/08/12.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Models

public typealias GetGuestDetailResponse = BaseArrayResponse<GuestDetailDTO>

public struct GuestDetailDTO: Codable, Response {
    public let profileID: Int
    public let profileName: String
    public let age: Int
    public let address, career: String
    public let keywords: [KeywordDTO]
    public let answers: [AnswerDTO]
    public let pictures: [String]

    enum CodingKeys: String, CodingKey {
        case profileID = "profileId"
        case profileName
        case age
        case address
        case career
        case keywords
        case answers
        case pictures
    }
}

extension Guest {
    public init(_ dto: GuestDetailDTO?) {
        guard let dto = dto else {
            fatalError()
        }
        let user = User(
            id: dto.profileID,
            name: dto.profileName,
            gender: .male,
            career: dto.career,
            birth: .init(),
            age: dto.age,
            address: dto.address,
            pictures: dto.pictures,
            answers: dto.answers.map { $0.answer },
            keyword: dto.keywords.map { $0.keyword }
        )
        self.init(user: user, isLiked: false)
    }
}
