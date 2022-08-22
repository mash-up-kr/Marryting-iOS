//
//  LikeRequestDataSource.swift
//  LikeRequestRoutingProtocol
//
//  Created by Woody on 2022/07/17.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Models

public protocol LoginDataStore {
    var thirdPartyToken: String? { get set }
}
