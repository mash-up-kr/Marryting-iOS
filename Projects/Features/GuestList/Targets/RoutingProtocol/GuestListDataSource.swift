//
//  GuestListDataSource.swift
//  GuestListRoutingProtocol
//
//  Created by Gunoo on 2022/07/17.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Models

public protocol GuestListDataStore {
    var guests: [Guest] { get set }
    var meetingId: Int? { get set }
}
