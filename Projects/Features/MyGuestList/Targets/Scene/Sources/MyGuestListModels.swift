//
//  MyGuestListModels.swift
//  
//
//  Created by Woody on 2022/07/17.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Models
import UIKit

enum MyGuestList {
    
    // MARK: Use cases
    
    enum FetchMyLikeGuests {
        struct Response {
            var guests: [Guest]
        }
        struct ViewModel {
            var myLikeGuestCellViewModels: [MyLikeGuestCellViewModel]
        }
    }

    enum FetchMatchingGuests {
        struct Response {
            var guests: [Guest]
        }
        struct ViewModel {
            var matchingGuestCellViewModels: [MatchingGuestCellViewModel]
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
