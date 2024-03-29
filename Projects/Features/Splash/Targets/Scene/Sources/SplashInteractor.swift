//
//  SplashInteractor.swift
//  
//
//  Created by Woody on 2022/08/23.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import SplashRoutingProtocol
import Models

protocol SplashBusinessLogic {
    func fetchUser()
}

final class SplashInteractor: SplashBusinessLogic, SplashDataStore {
    var presenter: SplashPresentationLogic?
    var worker: SplashWorkerProtocol?
    
    init(worker: SplashWorkerProtocol = SplashWorker()) {
        self.worker = worker
    }
    
    // MARK: Business Logic
    func fetchUser() {
        guard let worker = worker else {
            return
        }

        if worker.judgeIsUserLocallyExisted() &&
            worker.judgeIsTokenLocallyExisted() {
            presenter?.presentMeetingList()
        } else {
            presenter?.presentLogin()
        }

    }
    
}
