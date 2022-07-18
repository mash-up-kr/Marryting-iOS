//
//  LoginInteractor.swift
//  Login
//
//  Created by Woody on 2022/07/17.
//  Copyright (c) 2022 kr.mash-up. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import LoginRoutingProtocol
import Models

protocol LoginBusinessLogic {
    func appleLogin()
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore {

    var presenter: LoginPresentationLogic?
    var worker: LoginWorkerProtocol?

    init(worker: LoginWorkerProtocol = LoginWorker()) {
        self.worker = worker
    }
    
    func appleLogin() {
        worker?.fetchUser = { [weak self] result in
            switch result {
            case .success(_):
                // TODO: 비즈니스로직 작성
                self?.presenter?.presentLogin()
            case .failure:
                self?.presenter?.failLogin()
            }
        }
        worker?.appleLogin()
    }
}
