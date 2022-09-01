//
//  GuestListModule.swift
//  GuestListScene
//
//  Created by 박건우 on 2022/09/01.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import DataSource

public final class GuestListModule {
    
    public static let shared: GuestListModule = .init()
    
    public var guestListIndex: Int {
        get {
            GuestListLocalDataSource.shared.guestListIndex
        }
        set {
            GuestListLocalDataSource.shared.guestListIndex = newValue
        }
    }
}

