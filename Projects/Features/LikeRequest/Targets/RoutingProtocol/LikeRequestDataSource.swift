//
//  LikeRequestDataSource.swift
//  LikeRequestRoutingProtocol
//
//  Created by Gunoo on 2022/07/17.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Models

public protocol LikeRequestDataStore {
    var targetGuest: Guest? { get set }
    var weddingId: Int? { get set }
}
