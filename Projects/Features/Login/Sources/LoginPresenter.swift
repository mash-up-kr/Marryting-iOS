//
//  LoginPresenter.swift
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

protocol LoginPresentationLogic {
    func presentLogin()
    func failLogin()
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
    
    func presentLogin() {
        viewController?.alert()
        // TODO: VC의 라우팅 작업
    }
    
    func failLogin() {
        viewController?.alertFail()
    }
}
