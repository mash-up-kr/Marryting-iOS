//
//  LikeRequestCompleteWorker.swift
//  
//
//  Created by 박건우 on 2022/07/20.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import DataSource

protocol LikeRequestCompleteWorkerProtocol {
    func getMyName() -> String
}

final class LikeRequestCompleteWorker: LikeRequestCompleteWorkerProtocol {

    private let userLocalDataSource: UserLocalDataSoureceProtocol

    init(
        _ userLocalDataSource: UserLocalDataSoureceProtocol = UserLocalDataSourece()
    ) {
        self.userLocalDataSource = userLocalDataSource
    }

    func getMyName() -> String {
        guard let user = userLocalDataSource.read(key: .localUser) else { return "" }
        return user.name

    }
}
