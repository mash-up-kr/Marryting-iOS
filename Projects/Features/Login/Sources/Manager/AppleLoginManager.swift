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
    func appleLoginSuccess()
}

protocol AppleLoginManagerProtocol { }

final class AppleLoginManager: NSObject, AppleLoginManagerProtocol {
    weak var viewController: UIViewController?
    weak var delegate: AppleLoginManagerDelegate?

}

extension AppleLoginManager: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return viewController!.view.window!
    }
}

extension AppleLoginManager: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let userName = appleIDCredential.fullName
            let userEmail = appleIDCredential.email

            print(userIdentifier, userName, userEmail)
            delegate?.appleLoginSuccess()

        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        delegate?.appleLoginFail()
    }
}
