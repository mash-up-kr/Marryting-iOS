//
//  LikeRequestCompleteInteractor.swift
//  
//
//  Created by 박건우 on 2022/07/20.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import LikeRequestCompleteRoutingProtocol
import Models

protocol LikeRequestCompleteBusinessLogic {
    func fetchMyName()
}

final class LikeRequestCompleteInteractor: LikeRequestCompleteBusinessLogic, LikeRequestCompleteDataStore {
    var presenter: LikeRequestCompletePresentationLogic?
    var worker: LikeRequestCompleteWorkerProtocol?
    
    init(worker: LikeRequestCompleteWorkerProtocol = LikeRequestCompleteWorker()) {
        self.worker = worker
    }
    
    // MARK: Business Logic
    
    func fetchMyName() {
        guard let worker = worker else {
            return
        }
        presenter?.presentMyName(response: LikeRequestComplete.FetchMyName.Response(name: worker.getMyName()))
    }
    
}