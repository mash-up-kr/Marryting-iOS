//
//  GuestListRoutingLogic.swift
//  GuestList
//
//  Created by Gunoo on 2022/07/17.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

public protocol GuestListRoutingLogic {
    func routeToLikeRequestScene(targetId id: Int)

    func routeToMyGuestListScene()

    func routeToGuestDetailScene(targetId id: Int)

    func routeToSelf()
    
    func routeToMyProfile()
}
