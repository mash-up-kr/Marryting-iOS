//
//  GetKeywordResponse.swift
//  DataSource
//
//  Created by Woody on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Network

public typealias GetKeywordListResponse = BaseArrayResponse<GetKeywordResponseBody>

public struct GetKeywordResponseBody: Response {
    public let keywordID: Int
    public let keyword: String

    enum CodingKeys: String, CodingKey {
        case keywordID = "keywordId"
        case keyword = "keyword"
    }
}
