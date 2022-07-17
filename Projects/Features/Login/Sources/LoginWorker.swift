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

protocol LoginWorkerProtocol {
    var fetchUser: ((Result<User, Login.LoginError>) -> Void)? { get set }

    func appleLogin()
}

class LoginWorker: LoginWorkerProtocol {
    private let appleLoginManager: AppleLoginManager
    private let loginDataSource: LoginDataSourceProtocol

    var fetchUser: ((Result<User, Login.LoginError>) -> Void)?

    init(appleLoginManager: AppleLoginManager = AppleLoginManager(),
         loginDataSource: LoginDataSourceProtocol = LoginDataSource()) {
        self.appleLoginManager = appleLoginManager
        self.loginDataSource = loginDataSource

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

    func appleLoginFail() {
        fetchUser?(.failure(.appleLoginError))
    }

    func appleLoginSuccess(_ user: AppleLoginManager.AppleUser) {
        Task {
            do {
                let user = try await login()
                fetchUser?(.success(user))
            } catch {
                fetchUser?(.failure(.loginDataSourceError))
            }
        }
    }

    private func login() async throws -> User {
        do {
            let dto = try await loginDataSource.login(request: .init())
            // TODO: dto 명세후 매핑 로직 작성
            return dummyUser
        } catch {
            return dummyUser
        }
    }
}


private extension LoginWorker {
    var dummyUser: User {
        .init(
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
