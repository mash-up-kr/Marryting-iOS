//
//  MatchedGuest.swift
//  Models
//
//  Created by Woody on 2022/07/19.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

public struct MatchedGuest {
    public var guest: Guest
    public var loveMent: String

    public init(guest: Guest,
                loveMent: String) {
        self.guest = guest
        self.loveMent = loveMent
    }
}
