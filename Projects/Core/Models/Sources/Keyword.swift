//
//  Keyword.swift
//  Models
//
//  Created by Gunoo on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

public struct Keyword {
    public var id: Int
    public var keyword: String

    public init(
        id: Int,
        keyword: String
    ) {
        self.id = id
        self.keyword = keyword
    }
}
