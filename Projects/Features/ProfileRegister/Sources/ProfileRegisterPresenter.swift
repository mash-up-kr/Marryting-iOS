//
//  ProfileRegisterPresenter.swift
//  ProfileRegister
//
//  Created by Yoojin Park on 2022/07/09.
//  Copyright (c) 2022 kr.mash-up. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ProfileRegisterPresentationLogic
{
    func presentFirstPage(response: ProfileRegister.FetchFirstPage.Response)
    func presentImagePage(response: ProfileRegister.FetchImagePage.Response)
    func presentKeywordPage(response: ProfileRegister.FetchKeywordPage.Response)
    func presentSelectedKeyword(response: ProfileRegister.SelectKeywords.Response)
    func presentQuestionPage(response: ProfileRegister.FetchQuestionPage.Response)
}

class ProfileRegisterPresenter: ProfileRegisterPresentationLogic
{

    weak var viewController: ProfileRegisterDisplayLogic?

    func presentFirstPage(response: ProfileRegister.FetchFirstPage.Response) {
        viewController?.displayFirstPage(
            viewModel: .init(
                enterUserInfoViewModel: .init(
                    name: response.name,
                    gender: response.gender == .male ? "남성" : "여성",
                    birth: response.birth,
                    address: response.address,
                    career: response.career),
                pageNumber: response.pageNumber
            )
        )
    }
    
    func presentImagePage(response: ProfileRegister.FetchImagePage.Response) {
        viewController?.displayImagePage(viewModel:
                .init(images: response.images, pageNumber: response.pageNumber)
        )
    }

    func presentKeywordPage(response: ProfileRegister.FetchKeywordPage.Response) {
        viewController?.displayKeywordPage(
            viewModel: .init(
                keywords: response.keywords, selectedKeywords: response.selectedKeywords,
                pageNumber: response.pageNumber
            )
        )
    }

    func presentSelectedKeyword(response: ProfileRegister.SelectKeywords.Response) {
        viewController?.displaySelectedKeyword(
            viewModel: .init(selectedKeywords: response.keywords.map {
                .init(keywordID: $0.id, keyword: $0.keyword)
            })
        )
    }

    func presentQuestionPage(response: ProfileRegister.FetchQuestionPage.Response) {
        
    }

}
