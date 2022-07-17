//
//  Guest.swift
//  Models
//
//  Created by Gunoo on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

public struct Guest {
    public var user: User
    public var isLiked: Bool
    
    public init(
        user: User,
        isLiked: Bool
    ) {
        self.user = user
        self.isLiked = isLiked
    }
}
