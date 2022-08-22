//
//  ProfileRegisterModels.swift
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
import Models
import DesignSystem

enum ProfileRegister
{
  // MARK: Use cases

    enum DidTapFirstPageNext {
        struct Request {
            var name: String
            var gender: String
            var birth: String
            var address: String
            var career: String
        }
    }

    enum FetchFirstPage {
        struct Response {
            var userInfo: UserInfo
        }

        struct ViewModel {
            var enterUserInfoViewModel: EnterUserInfoViewModel
            var pageNumber: Int
        }
    }

    enum DidTapImagePageNext {
        struct Response {
            var image: UIImage
        }

        struct ViewModel {

        }
    }

    enum FetchImagePage {
        struct Response {
            var images: [UIImage]
            var pageNumber: Int
        }

        struct ViewModel {
            var images: [UIImage]
            var pageNumber: Int
        }
    }

    enum FetchKeywordPage {

        struct Response {
            var keywords: [Keyword]
            var selectedKeywords: [Keyword]
            var pageNumber: Int
        }

        struct ViewModel {
            var keywords: [Keyword]
            var selectedKeywords: [Keyword]
            var pageNumber: Int
        }
    }

    enum UploadImage {
        struct Request {
            var image: UIImage
        }
        struct Response {
            var image: UIImage
        }
        struct ViewModel {
            var image: UIImage
        }
    }

    enum SelectKeywords {
        struct Request {
            var keywords: [SelectTagListKeywordModel]
        }
    }
    
    enum SelectAnswers {
        struct Request {
            var answers: [AnswerViewModel]
        }
    }
    
    enum DidTapKeywordPageNext {
        struct Response {
            
        }

        struct ViewModel {

        }
    }

    enum FetchQuestionPage {
        struct Response {
            var questions: [Question]
            var pageNumber: Int
        }

        struct ViewModel {
            var questionViewModels: [QuestionViewModel]
            var pageNumber: Int
        }
    }

    enum DidTapQuestionPageNext {
        struct Response {

        }

        struct ViewModel {

        }
    }

    enum RegisterProfile {
        struct Request {

        }

        struct Response {

        }

        struct ViewModel {

        }
    }
}

struct UserInfo {
    var name: String
    var gender: String
    var birth: String
    var address: String
    var career: String
    
    init(name: String = "", gender: String = "", birth: String = "", address: String = "", career: String = "") {
        self.name = name
        self.gender = gender
        self.birth = birth
        self.address = address
        self.career = career
    }
}
