//
//  GuestDetailPresenter.swift
//  
//
//  Created by Woody on 2022/07/20.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol GuestDetailPresentationLogic {
    func presentGuest(response: GuestDetail.GetGuest.Response)
}

final class GuestDetailPresenter: GuestDetailPresentationLogic {
    weak var viewController: GuestDetailDisplayLogic?
    
    // MARK: Presentation Logic

    func presentGuest(response: GuestDetail.GetGuest.Response) {
        let user = response.guest.user
        self.viewController?.displayGuest(
            viewModel: .init(
                guest: .init(
                    name: user.name,
                    age: user.age,
                    address: user.address,
                    career: user.career,
                    isLiked: response.guest.isLiked,
                    images: user.pictures.map {
                        UserProfileImagewCellViewModel(userProfileImageViewModel: .init(imageUrl: $0))
                    },
                    keywords: .init(keywords: user.keyword.map { .init(keyword: $0.keyword) }),
                    answers: .init(
                        fightAnswer: user.answer1.answer,
                        communicationAnswer: user.answer2.answer,
                        dateAnswer: user.answer3.answer
                    )
                )
            )
        )
    }
}
