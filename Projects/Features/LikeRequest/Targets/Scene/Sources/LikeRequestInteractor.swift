//
//  LikeRequestInteractor.swift
//  LikeRequest
//
//  Created by Gunoo on 2022/07/16.
//  Copyright (c) 2022 kr.mash-up. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import LikeRequestRoutingProtocol
import Models
import UIKit

protocol LikeRequestBusinessLogic {
    func fetchIntroduceContents()
}

class LikeRequestInteractor: LikeRequestBusinessLogic, LikeRequestDataStore {
    var presenter: LikeRequestPresentationLogic?
    var worker: LikeRequestWorkerProtocol?
    
    var targetGuest: Guest?
    
    init(worker: LikeRequestWorkerProtocol = LikeRequestWorker()) {
        self.worker = worker
    }
    
    // MARK: Business Logic
    
    func fetchIntroduceContents() {
        guard let worker = worker else {
            return
        }
        presenter?.presentIntroduceContents(response: .init(userName: worker.getMyName()))
    }
}