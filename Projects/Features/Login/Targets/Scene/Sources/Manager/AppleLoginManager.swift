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
    func appleLoginFail(_ error: Login.LoginError)
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
            guard let userIdentifier = userIdentifier,
                  let userIdentifier = String(data: userIdentifier, encoding: .utf8) else {
                delegate?.appleLoginFail(.parsing)
                return
            }
            delegate?.appleLoginSuccess(
                AppleUser(userIdentifier: userIdentifier)
            )
        }
    }

    func authorizationController(
        controller: ASAuthorizationController,
        didCompleteWithError error: Error)
    {
        delegate?.appleLoginFail(.appleLoginError)
    }
}

extension AppleLoginManager {
    struct AppleUser {
        let userIdentifier: String
    }
}
