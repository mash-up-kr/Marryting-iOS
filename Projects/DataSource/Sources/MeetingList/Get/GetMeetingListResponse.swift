//
//  GetMettingListResponse.swift
//  DataSource
//
//  Created by Woody on 2022/08/13.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Models
import Foundation

public typealias GetMeetingListResponse = BaseArrayResponse<GetMeetingListDTO>

public struct GetMeetingListDTO: Codable, Response {
    public let weddingID: Int
    public let groomName: String
    public let brideName: String
    public let weddingDate: String

    enum CodingKeys: String, CodingKey {
        case weddingID = "weddingId"
        case groomName, brideName, weddingDate
    }
}

extension Meeting {
    public init(_ dto: GetMeetingListDTO) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.init(
            id: dto.weddingID,
            groomName: dto.groomName,
            brideName: dto.brideName,
            date: dateFormatter.date(from: dto.weddingDate) ?? Date()
        )
    }
}
