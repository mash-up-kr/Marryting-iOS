//
//  DeleteUserRequest.swift
//  DataSource
//
//  Created by 박건우 on 2022/08/30.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public struct DeleteUserRequest: Request {

    public typealias Body = EmptyRequestBody

    public typealias Output = DeleteUserResponse

    public var endpoint: String = "/api/v1/users"

    public var method: HTTPMethod = .delete

    public init(userId: Int) {
        endpoint = endpoint + "/\(userId)"
    }
}
