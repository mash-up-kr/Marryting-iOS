//
//  ProfileRegisterCompleteWorker.swift
//  
//
//  Created by Woody on 2022/08/09.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import DataSource

protocol ProfileRegisterCompleteWorkerProtocol {
    func getMyName() -> String
}

final class ProfileRegisterCompleteWorker: ProfileRegisterCompleteWorkerProtocol {

    func getMyName() -> String {
        "박우인"
    }
}