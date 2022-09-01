//
//  GetQuestionsRequest.swift
//  DataSource
//
//  Created by Woody on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Network
import NetworkProtocol

public struct GetQuestionsRequest: Request {

    public typealias Body = EmptyRequestBody

    public typealias Output = GetQuestionsResponse

    public var endpoint: String = "/api/v1/questionnaire"

    public var method: HTTPMethod = .get

    public var header: HTTPHeader = [:]

    public init() {}

}
