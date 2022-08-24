//
//  GuestListReqeust.swift
//  DataSource
//
//  Created by Gunoo on 2022/07/16.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public struct GetGuestListRequest: Request {
    
    public typealias Body = EmptyRequestBody
    
    public typealias Output = GetGuestListResponse
    
    public var endpoint: String {
        return "/api/v1/wedding/\(weddingID)/guests"
    }
    
    public var method: HTTPMethod = .get

    public var weddingID: Int = 1

    public init(weddingID: Int) {
        self.weddingID = weddingID
    }
}
