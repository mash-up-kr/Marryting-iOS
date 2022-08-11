//
//  KeywordDTO.swift
//  DataSource
//
//  Created by Woody on 2022/08/11.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

public struct KeywordDTO: Codable {
    public let keyword, keywordID: String

    enum CodingKeys: String, CodingKey {
        case keyword
        case keywordID = "keywordId"
    }
}



