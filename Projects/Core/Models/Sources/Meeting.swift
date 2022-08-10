//
//  Meeting.swift
//  Models
//
//  Created by 박건우 on 2022/08/07.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

public struct Meeting {
    public var id: String
    public var groomName: String
    public var brideName: String
    public var date: Date
    
    public init(
        id: String,
        groomName: String,
        brideName: String,
        date: Date
    ) {
        self.id = id
        self.groomName = groomName
        self.brideName = brideName
        self.date = date
    }
}
