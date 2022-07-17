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

protocol LoginWorkerProtocol {

}
class LoginWorker: LoginWorkerProtocol {
    private let appleLoginManager: AppleLoginManager
    private let loginDataSource: LoginDataSourceProtocol

    init(appleLoginManager: AppleLoginManager,
         loginDataSource: LoginDataSourceProtocol = LoginDataSource()) {
        self.appleLoginManager = appleLoginManager
        self.loginDataSource = loginDataSource
    }

    func login() async throws -> User {
        do {
            let dto = try await loginDataSource.login(request: .init())
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
