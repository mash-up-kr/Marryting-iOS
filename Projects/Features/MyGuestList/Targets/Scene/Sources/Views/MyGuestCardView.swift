//
//  MyGuestCardView.swift
//  MyGuestListRoutingProtocol
//
//  Created by Woody on 2022/07/18.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import DesignSystem
import UIKit

import Kingfisher
import SnapKit

struct MyGuestCardViewModel {
    var id: Int
    var imageUrl: String
    var name: String
    var age: Int
    var address: String
    var job: String
    var isLiked: Bool
}
