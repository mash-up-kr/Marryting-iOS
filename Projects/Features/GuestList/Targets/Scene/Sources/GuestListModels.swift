//
//  GuestListModels.swift
//  GuestList
//
//  Created by Gunoo on 2022/07/09.
//  Copyright (c) 2022 kr.mash-up. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Models

enum GuestList {
    // MARK: Use cases
    
    enum FetchGuests {
        struct Response {
            var guests: [Guest]
        }
        struct ViewModel {
            var guestCardViewModels: [GuestCardViewModel]
        }
    }
    
    enum DidTapLike {
        struct Request {
            var targetId: Int
        }
        
        struct Response {
            var target: Guest
        }
    }
}