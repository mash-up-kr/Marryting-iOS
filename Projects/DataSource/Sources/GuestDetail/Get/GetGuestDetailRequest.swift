//
//  GetGuestDetailRequest.swift
//  DataSource
//
//  Created by Woody on 2022/08/12.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public struct GetGuestDetailRequest: Request {

    public typealias Body = EmptyRequestBody

    public typealias Output = GetGuestDetailResponse

    public var endpoint: String = "/api/v1/profile"

    public var method: HTTPMethod = .get

    public init(profileID: Int) {
        endpoint = endpoint + "/\(profileID)" + "/detail"
    }
}
