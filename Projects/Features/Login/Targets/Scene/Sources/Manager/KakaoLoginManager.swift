//
//  KakaoLoginManager.swift
//  LoginScene
//
//  Created by Woody on 2022/08/25.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation
import KakaoSDKUser

protocol KakaoLoginManager {
    func kakaoLogin(completion: @escaping (Result<String?, Error>) -> Void)
}

class KakaoLoginManagerImpl: KakaoLoginManager {

    func kakaoLogin(completion: @escaping (Result<String?, Error>) -> Void) {
        if UserApi.isKakaoTalkLoginAvailable() {
            self.loginWithKakaotalk(completion: { result in
                completion(result)
            })
        } else {
            self.loginWithWeb(completion: { result in
                completion(result)
            })
        }
    }

    private func loginWithKakaotalk(completion: @escaping (Result<String?, Error>) -> Void) {
        UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                let accessToken = oauthToken?.accessToken
                completion(.success(accessToken))
            }
        }
    }

    private func loginWithWeb(completion: @escaping (Result<String?, Error>) -> Void) {
        UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
            if let error = error {
                completion(.failure(error))
            } else {
                let accessToken = oauthToken?.accessToken
                completion(.success(accessToken))
            }
        }
    }
}

extension KakaoLoginManager {
//    private func callUserAPI() {
//        UserApi.shared.me { [weak self] (user, error) in
//            if let error = error {
//
//            } else {
//                if let userID = user?.id {
//
//                }
//            }
//        }
//    }
}
