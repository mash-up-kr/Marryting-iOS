//
//  GuestDetailInteractor.swift
//  
//
//  Created by Woody on 2022/07/20.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import GuestDetailRoutingProtocol
import Models

protocol GuestDetailBusinessLogic {
    func fetchGuest()
    func withdraw()
}

final class GuestDetailInteractor: GuestDetailBusinessLogic, GuestDetailDataStore {
    var presenter: GuestDetailPresentationLogic?
    var worker: GuestDetailWorkerProtocol?

    var targetGuest: Guest?

    var meetingID: Int?
    
    init(worker: GuestDetailWorkerProtocol = GuestDetailWorker()) {
        self.worker = worker
    }
    
    // MARK: Business Logic

    func fetchGuest() {
        guard let selectedGuest = targetGuest else {
            // 마이 페이지 일경우
            guard let worker = worker else {
                return
            }

            let user = worker.fetchUser()
            self.fetchChangeMeetingButton()
            presenter?.presentGuest(response: .init(guest: .init(user: user, isLiked: false)))
            return
        }

        presenter?.presentGuest(response: .init(guest: selectedGuest))
    }
    
    func withdraw() {
        guard let worker = worker else {
            return
        }
        Task {
            do {
                try await worker.withdraw()
                presenter?.presentWithdrawResult()
            } catch {
                
            }
        }
    }

    private func fetchChangeMeetingButton() {
        guard let worker = worker else {
            return
        }
        Task {
            do {
                let meetings = try await worker.fetchMeetings()
                presenter?.presentMeetingChangeButton(response: .init(meetings: meetings))
            } catch {

            }
        }
    }
}
