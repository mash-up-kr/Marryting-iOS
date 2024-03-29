//
//  GuestListPresenter.swift
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

protocol GuestListPresentationLogic {
    func presentGuests(response: GuestList.FetchGuests.Response)
}

class GuestListPresenter: GuestListPresentationLogic {
    weak var viewController: GuestListDisplayLogic?
    
    // MARK: Presentation Logic
    
    
    func presentGuests(response: GuestList.FetchGuests.Response) {
        self.viewController?.displayGuests(
            viewModel: .init(
                guestCardViewModels: response.guests
                    .filter({
                        $0.isLiked == false
                    })
                    .map {
                        .init(
                            id: $0.user.id,
                            imageUrl: $0.user.picture,
                            name: $0.user.name,
                            age: "\($0.user.age)",
                            info: "\($0.user.address)  ∙  \($0.user.career)",
                            isLiked: $0.isLiked
                        )
                    }
            )
        )
    }
}
