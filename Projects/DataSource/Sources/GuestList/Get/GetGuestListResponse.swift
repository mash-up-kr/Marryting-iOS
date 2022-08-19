//
//  GetGuestListResponse.swift
//  DataSource
//
//  Created by Gunoo on 2022/07/16.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Models

public typealias GetGuestListResponse = BaseArrayResponse<GetGuestListDTO>

public struct GetGuestListDTO: Codable, Response {
    public let address: String
    public let age: Int
    public let career: String
    public let keywords: [String]
    public let name: String
    public let profileURL: [String]
    public let weddingID: Int
    public let profileID: Int

    enum CodingKeys: String, CodingKey {
        case address, age, career, keywords, name
        case profileID = "profileId"
        case profileURL = "profileUrl"
        case weddingID = "weddingId"
    }
}

public extension Guest {

    #warning("서버 수정 후에 주석으로 대체해야함")
    init(_ dto: GetGuestListDTO) {
        let user = User(id: dto.profileID,
                        name: dto.name,
                        gender: .male,//dto.gender == "MALE" ? .male : .female,
                        career: dto.career,
                        birth: .init(),
                        age: dto.age,
                        address: dto.address,
                        pictures: dto.profileURL,
                        answers: [], //dto.answers.map { $0.answer },
                        keyword: [] //dto.keywords.map { $0.keyword }
        )
        self.init(user: user, isLiked: false)
    }
}
