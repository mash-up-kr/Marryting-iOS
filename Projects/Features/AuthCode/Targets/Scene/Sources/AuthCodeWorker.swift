//
//  AuthCodeWorker.swift
//  
//
//  Created by 박건우 on 2022/08/20.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import DataSource

protocol AuthCodeWorkerProtocol {
    func requestWeddingCode(weddingCode: String) async throws -> Int
}

final class AuthCodeWorker: AuthCodeWorkerProtocol {
    
    let weddingCodeDataSource: WeddingCodeDataSourceProtocol
    
    init(weddingCodeDataSource: WeddingCodeDataSourceProtocol = WeddingCodeDataSource()) {
        self.weddingCodeDataSource = weddingCodeDataSource
    }
    
    func requestWeddingCode(weddingCode: String) async throws -> Int {
        let response = try await weddingCodeDataSource.getWeddingCodeRequest(request: .init(weddingCode: weddingCode))
        return response.data?.weddingId ?? 0
    }
}
