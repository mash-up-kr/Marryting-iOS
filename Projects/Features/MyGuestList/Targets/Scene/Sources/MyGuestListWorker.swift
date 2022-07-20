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

    init(myGuestListDataSource: MyGuestListDataSourceProtocol = MyGuestListDataSource()) {
        self.myGuestListDataSource = myGuestListDataSource
    }

    func fetchMyLikeGuests() async throws -> [Guest] {
        do {
            let dto = try await myGuestListDataSource.getMyLikeGuestList(request: .init())

            return dummyLikeGuests
        } catch {
            return dummyLikeGuests
        }
    }

    func fetchMatchingGuests() async throws -> [MatchedGuest] {
        do {
            let dto = try await myGuestListDataSource.getMatchingGuestList(request: .init())

            return dummyMatchingGuests
        } catch {
            return dummyMatchingGuests
        }

    }
}

private extension MyGuestListWorker {
    var dummyLikeGuests: [Guest] {
        [
            .init(
                user: .init(
                    id: 1,
                    name: "박건우",
                    gender: .male,
                    career: "IT회사 개발자",
                    birth: .init(),
                    age: 21,
                    address: "서울시 금천구",
                    pictures: ["https://img.sbs.co.kr/newsnet/etv/upload/2021/03/05/30000673929_1280.jpg"],
                    answers: [],
                    keyword: []
                ),
                isLiked: false
            ),
            .init(
                user: .init(
                    id: 2,
                    name: "이재용",
                    gender: .male,
                    career: "학생",
                    birth: .init(),
                    age: 25,
                    address: "포항항",
                    pictures: ["https://i.pinimg.com/originals/2c/2c/60/2c2c60b20cb817a80afd381ae23dab05.jpg"],
                    answers: [],
                    keyword: []
                ),
                isLiked: false
            )
        ]
    }

    var dummyMatchingGuests: [MatchedGuest] {
        [
            .init(
                guest:.init(
                    user: .init(
                        id: 3,
                        name: "박재민",
                        gender: .male,
                        career: "IT회사 개발자",
                        birth: .init(),
                        age: 25,
                        address: "비공개",
                        pictures: ["https://img.theqoo.net/img/fzxPW.jpg"],
                        answers: [],
                        keyword: []
                    ),
                    isLiked: true
                ),
                loveMent: "그대가 찾는 사람, 바로 저입니다"
            ),
            .init(
                guest: .init(
                    user: .init(
                        id: 4,
                        name: "강진호",
                        gender: .male,
                        career: "IT회사 개발자",
                        birth: .init(),
                        age: 30,
                        address: "비공개",
                        pictures: ["https://post-phinf.pstatic.net/MjAxOTAyMTZfMTMz/MDAxNTUwMjg0NTQ3Njk3.nOALV-TOkthnpIEg3kFCA6QA221DrLgZsBJxMKE1Hj0g.I_EYQvpkiwhl8Jj9sTBfNIs5U7Hai968vAqa5BJHlpAg.JPEG/n1233.jpg?type=w1200"],
                        answers: [],
                        keyword: []
                    ),
                    isLiked: false
                ),
                loveMent: "그대의 눈동자에 cheers~!"
            )
        ]
    }
}
