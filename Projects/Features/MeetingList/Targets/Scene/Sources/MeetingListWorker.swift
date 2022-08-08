//
//  MeetingListWorker.swift
//  
//
//  Created by 박건우 on 2022/08/06.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Models

protocol MeetingListWorkerProtocol {
    func fetchMeetings() async throws -> [Meeting]
}

final class MeetingListWorker: MeetingListWorkerProtocol {
    func fetchMeetings() async throws -> [Meeting] {
        return [
            .init(id: "1", groomName: "김신랑", brideName: "박신부", date: Date()),
            .init(id: "2", groomName: "현빈", brideName: "손예진", date: Date()),
            .init(id: "3", groomName: "신랑", brideName: "신부", date: Date()),
            .init(id: "4", groomName: "현빈", brideName: "손예진", date: Date()),
            .init(id: "5", groomName: "현빈", brideName: "손예진", date: Date()),
        ]
    }
}