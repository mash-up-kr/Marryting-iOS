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
    func registerProfile() async throws -> Void
}

class ProfileRegisterWorker: ProfileRegisterWorkerProtocol {
    private let keywordListDataSource: KeywordListDataSourceProtocol
    private let questiondDataSource: QuestiondDataSourceProtocol
    private let imageDataSource: ImageDataSourceProtocol
//    private let signUpDataSource: SignUpDataSourceProtocol

    init(
        keywordListDataSource: KeywordListDataSourceProtocol = KeywordListDataSource(),
        questiondDataSource: QuestiondDataSourceProtocol = QuestionDataSource(),
        imageDataSource: ImageDataSourceProtocol = ImageDataSource()
    ) {
        self.keywordListDataSource = keywordListDataSource
        self.questiondDataSource = questiondDataSource
        self.imageDataSource = imageDataSource
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
        let imageData = image.jpegData(compressionQuality: 1.0)!
        let imageURL = try await self.imageDataSource.postImage(request: .init(imageData: imageData))
        return imageURL.data
    }

    func registerProfile() async throws -> Void {
//        let userInfo = try await self.signUpDataSource.postSignUp(request: PostSignUpRequest(body: <#T##PostSignUpRequestBody#>))
        return
    }
}
