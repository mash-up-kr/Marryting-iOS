//
//  LoginWorker.swift
//  Login
//
//  Created by Woody on 2022/07/17.
//  Copyright (c) 2022 kr.mash-up. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import DataSource
import Models
import UIKit
import AuthenticationServices
import NetworkProtocol

protocol LoginWorkerProtocol {
    var fetchUser: ((Result<Login.FetchUser.Response, Login.LoginError>) -> Void)? { get set }
    
    func appleLogin()
}

class LoginWorker: LoginWorkerProtocol {

    private let appleLoginManager: AppleLoginManager
    private let loginDataSource: LoginDataSourceProtocol
    private let testUserDatSource: TestTokenDataSourceProtocol
    private let userLocalDataSource: UserLocalDataSoureceProtocol

    var fetchUser: ((Result<Login.FetchUser.Response, Login.LoginError>) -> Void)?

    init(appleLoginManager: AppleLoginManager = AppleLoginManager(),
         loginDataSource: LoginDataSourceProtocol = LoginDataSource(),
         testUserDataSource: TestTokenDataSourceProtocol = TestTokenDataSource(),
         userLocalDataSource: UserLocalDataSoureceProtocol = UserLocalDataSourece()) {
        self.appleLoginManager = appleLoginManager
        self.loginDataSource = loginDataSource
        self.testUserDatSource = testUserDataSource
        self.userLocalDataSource = userLocalDataSource

        appleLoginManager.delegate = self
    }

    func appleLogin() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])

        authorizationController.delegate = appleLoginManager
        authorizationController.presentationContextProvider = appleLoginManager
        authorizationController.performRequests()
    }
}

extension LoginWorker: AppleLoginManagerDelegate {

    func appleLoginFail(_ error: Login.LoginError) {
        fetchUser?(.failure(error))
    }

    func appleLoginSuccess(_ user: AppleLoginManager.AppleUser) {
        Task {
            do {
                let result = try await login(token: user.userIdentifier)
                fetchUser?(result)
            } catch {
                fetchUser?(.failure(.loginDataSourceError))
            }
        }
    }

    private func login(token: String) async throws -> (Result<Login.FetchUser.Response, Login.LoginError>) {
        do {
            let dto = try await loginDataSource.login(
                request: .init(
                    body: .init(oauthType: "APPLE", thirdPartyToken: token)
                )
            )
            guard let data = dto.data else {
                return .failure(Login.LoginError.noUser(token))
            }

            let token = data.accessToken
            userLocalDataSource.saveToken(token, key: .token)
            print("--------- 토큰 --------")
            print(token)

            let user = convertToUser(data)
            print("--------- 유저 --------")
            print(user)
            return .success(.init(user: user))
        } catch {
            return .failure(Login.LoginError.noUser(token))
        }
    }

    private func convertToUser(_ body: PostLoginResponseBody) -> User {
        let profile = body.profile
        return .init(id: profile.profileID, name: profile.profileName, gender: .male, career: profile.career, birth: .init(), age: profile.age, address: profile.address, pictures: profile.pictures, answers: profile.answers.map { .init(questionID: $0.questionID, answer: $0.answer)}, keyword: profile.keywords.map { .init(id: $0.keywordID, keyword: $0.keyword) } )
    }

    private func convertToLocalUser(_ body: PostLoginResponseBody) -> LocalUser {
        let profile = body.profile
        return .init(id: profile.profileID, name: profile.profileName, gender: .male, career: profile.career, birth: .init(), age: profile.age, address: profile.address, pictures: profile.pictures, answers: profile.answers.map { .init(questionID: $0.questionID, answer: $0.answer)}, keyword: profile.keywords.map { .init(id: $0.keywordID, keyword: $0.keyword) } )
    }
}

#if DEBUG
private extension LoginWorker {
    var dummyUser: User {
        .init(
            id: 1,
            name: "박건우",
            gender: .male,
            career: "IT회사 개발자",
            birth: .init(),
            age: 21,
            address: "서울시 금천구",
            pictures: ["https://img.sbs.co.kr/newsnet/etv/upload/2021/03/05/30000673929_1280.jpg"],
            answers: [],
            keyword: []
        )
    }
}
#endif
