//
//  AppleLoginManager.swift
//  Login
//
//  Created by Woody on 2022/07/17.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import UIKit
import AuthenticationServices

protocol AppleLoginManagerDelegate: AnyObject {
    func appleLoginFail()
    func appleLoginSuccess(_ user: AppleLoginManager.AppleUser)
}

final class AppleLoginManager: NSObject {
    weak var viewController: UIViewController?
    weak var delegate: AppleLoginManagerDelegate?

}

extension AppleLoginManager: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return viewController!.view.window!
    }
}

extension AppleLoginManager: ASAuthorizationControllerDelegate {
    
    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithAuthorization authorization: ASAuthorization
    ) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.identityToken
            let userName = appleIDCredential.fullName
            let userEmail = appleIDCredential.email
            let userToken = appleIDCredential.authorizationCode
            print(userIdentifier, userName, userEmail, userToken)
            guard let userIdentifier = userIdentifier else {
                return
            }

            print(String(data: userIdentifier, encoding: .utf8))

            let appleUser = dummyAppleUser
            delegate?.appleLoginSuccess(appleUser)
        }
    }

    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithError error: Error)
    {
        delegate?.appleLoginFail()
    }
}

extension AppleLoginManager {

    struct AppleUser {
        let userIdentifier: String
        let userName: String
        let userEmail: String
    }

    fileprivate var dummyAppleUser: AppleUser {
        .init(userIdentifier: "1234",
              userName: "Gunwoo Park",
              userEmail: "marryting0810@gmail.com")
    }
}
