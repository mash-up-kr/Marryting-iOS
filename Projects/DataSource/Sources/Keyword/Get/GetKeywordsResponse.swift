//
//  GetKeywordResponse.swift
//  DataSource
//
//  Created by Woody on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Network

public typealias GetKeywordsResponse = BaseArrayResponse<KeywordResponseBody>

public struct KeywordResponseBody: Codable, Response {
    var keywordID: Int
    var keyword: String

    enum CodingKeys: String, CodingKey {
        case keywordID = "keywordId"
        case keyword = "keyword"
    }
}
