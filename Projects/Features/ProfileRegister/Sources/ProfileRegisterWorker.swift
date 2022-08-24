//
//  ProfileRegisterWorker.swift
//  ProfileRegister
//
//  Created by Yoojin Park on 2022/07/09.
//  Copyright (c) 2022 kr.mash-up. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import DataSource
import Models
import UIKit
import Alamofire

//private var selectedKeywords: [Keyword] = []
//private var selectedImages: [UIImage] = []
//private var userInfo: UserInfo = .init()
//private var selectedAnswers: [Answer] = []

protocol ProfileRegisterWorkerProtocol {
    func fetchKeywords() async throws -> [Keyword]
    func fetchQuestions() async throws -> [Question]
    func updateImage(image: UIImage) async throws -> String
    func registerProfile(oauthToken: String, selectedImageUrls: [String], userInfo: UserInfo, selectedAnswers: [Answer], selectedKeywords: [Keyword], thirdPartyToken: String) async throws -> Void
}

class ProfileRegisterWorker: ProfileRegisterWorkerProtocol {
    private let keywordListDataSource: KeywordListDataSourceProtocol
    private let questiondDataSource: QuestiondDataSourceProtocol
    private let imageDataSource: ImageDataSourceProtocol
    private let signUpDataSource: SignUpDataSourceProtocol
    private let userLocalDataSourece: UserLocalDataSoureceProtocol

    init(
        keywordListDataSource: KeywordListDataSourceProtocol = KeywordListDataSource(),
        questiondDataSource: QuestiondDataSourceProtocol = QuestionDataSource(),
        imageDataSource: ImageDataSourceProtocol = ImageDataSource(),
        signUpDataSource: SignUpDataSourceProtocol = SignUpDataSource(),
        userLocalDataSourece: UserLocalDataSoureceProtocol = UserLocalDataSourece()
    ) {
        self.keywordListDataSource = keywordListDataSource
        self.questiondDataSource = questiondDataSource
        self.imageDataSource = imageDataSource
        self.signUpDataSource = signUpDataSource
        self.userLocalDataSourece = userLocalDataSourece
    }

    func fetchKeywords() async throws -> [Keyword] {
        let keywords = try await self.keywordListDataSource.getKeywords(request: GetKeywordsRequest())
        guard let data = keywords.data else { return [] }
        let keyowrds = data.map { Keyword(id: $0.keywordID, keyword: $0.keyword) }
        return keyowrds
    }

    func fetchQuestions() async throws -> [Question] {
        let questions = try await self.questiondDataSource.getQuestions(request: GetQuestionsRequest())
        guard let data = questions.data else { return [] }
        return data.map { Question(questionId: $0.questionID, question: $0.question, answer1: $0.answer1, answer2: $0.answer2) }
    }

    func updateImage(image: UIImage) async throws -> String {
        
        guard let tmpImageData = image.jpegData(compressionQuality: 1.0) else {
            return ""
        }
        var imageData: Data? = tmpImageData
        if tmpImageData.count > 10000000 {
            imageData = image.jpegData(compressionQuality: CGFloat(10000000.0 / Double(tmpImageData.count)))
        }
        guard let imageData = imageData else {
            return ""
        }

        let imageURL = try await self.imageDataSource.postImage(request: .init(imageData: imageData))
        return imageURL.data
    }

    func registerProfile(oauthToken: String, selectedImageUrls: [String], userInfo: UserInfo, selectedAnswers: [Answer], selectedKeywords: [Keyword], thirdPartyToken: String) async throws -> Void {
        let user = try await signUpDataSource.postSignUp(
            request: .init(
                body: .init(
                    oauthType: oauthToken,
                    profile: .init(address: userInfo.address,
                                   answers: selectedAnswers.map { .init(answer: $0.answer, questionId: $0.questionID) },
                                   birth: convertDateFormat(birth: userInfo.birth),
                                   career: userInfo.career,
                                   gender: userInfo.gender == "남성" ? "MALE" : "FEMALE",
                                   keywords: selectedKeywords.map { .init(keyword: $0.keyword, keywordId: $0.id) },
                                   name: userInfo.name,
                                   pictures: selectedImageUrls),
                    thrdPartyToken: thirdPartyToken
                )
            )
        )
//        userLocalDataSourece.save(<#T##data: Decodable & Encodable##Decodable & Encodable#>, key: .localUser)
        return
    }
    
    private func convertDateFormat(birth: String) -> String {
        Formatter.dateFormatter.string(from: Formatter.koreanDateFormatter.date(from: birth)!)
    }

//    func convertToLocalUser(responseBody: PostSignUpResponseBody) -> LocalUser {
//        let profile = responseBody.profileId
//        return .init(id: user.profileId, name: user., gender: <#T##LocalGender#>, career: <#T##String#>, birth: <#T##Date#>, age: <#T##Int#>, address: <#T##String#>, pictures: <#T##[String]#>, answers: <#T##[LocalAnswer]#>, keyword: <#T##[LocalKeyword]#>)
//    }
}
