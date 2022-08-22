//
//  MyGuestListWorker.swift
//  
//
//  Created by Woody on 2022/07/17.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import DataSource
import Models

protocol MyGuestListWorkerProtocol {
    func fetchMyLikeGuests() async throws -> [Guest]
    func fetchMatchingGuests() async throws -> [MatchedGuest]
}

final class MyGuestListWorker: MyGuestListWorkerProtocol {
    private let myGuestListDataSource: MyGuestListDataSourceProtocol
    private let userDataSource: UserLocalDataSoureceProtocol

    init(myGuestListDataSource: MyGuestListDataSourceProtocol = MyGuestListDataSource(),
         userDataSource: UserLocalDataSoureceProtocol = UserLocalDataSourece()) {
        self.myGuestListDataSource = myGuestListDataSource
        self.userDataSource = userDataSource
    }

    func fetchMyLikeGuests() async throws -> [Guest] {
        do {

            let dto = try await myGuestListDataSource.getMyLikeGuestList(request: .init())
            guard let myLikeGuestListDTO = dto.data else { return [] }
            let myLikeGuestList = myLikeGuestListDTO.map { Guest($0) }
            return myLikeGuestList
        } catch {
            return []
        }
    }

    func fetchMatchingGuests() async throws -> [MatchedGuest] {
        do {
            let dto = try await myGuestListDataSource.getMatchingGuestList(request: .init())
            guard let matchingGuestListDTO = dto.data else { return [] }
            let matchingGuestList = matchingGuestListDTO.map { MatchedGuest($0) }
            return matchingGuestList
        } catch {
            return []
        }

    }
}

extension Guest {
    init(_ dto: GetMyLikeGuestResponseBody) {
        let user = User(id: dto.profileID,
                        name: dto.name,
                        gender: dto.gender == "MALE" ? .male : .female,
                        career: dto.career,
                        birth: .init(),
                        age: dto.age,
                        address: dto.address,
                        pictures: dto.pictures,
                        answers: dto.answers.map { .init(questionID: $0.questionID, answer: $0.answer) },
                        keyword: dto.keywords.map { .init(id: $0.keywordID, keyword: $0.keyword) })
        self.init(user: user, isLiked: true)
    }
}

extension MatchedGuest {

    init(_ dto: GetMatchingGuestResponseBody) {
        let user = User(id: dto.profileID,
                        name: dto.name,
                        gender: dto.gender == "MALE" ? .male : .female,
                        career: dto.career,
                        birth: .init(),
                        age: dto.age,
                        address: dto.address,
                        pictures: dto.pictures,
                        answers: dto.answers.map { .init(questionID: $0.questionID, answer: $0.answer) },
                        keyword: dto.keywords.map { .init(id: $0.keywordID, keyword: $0.keyword) })
        self.init(guest: Guest(user: user, isLiked: true), loveMent: dto.message)
    }
}
