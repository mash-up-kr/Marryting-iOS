//
//  LoginRouter.swift
//  Login
//
//  Created by Woody on 2022/07/16.
//  Copyright (c) 2022 kr.mash-up. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import LoginRoutingProtocol
import GuestListScene
import MeetingListScene

public class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing {
    public weak var viewController: UIViewController?
    public var dataStore: LoginDataStore?
    
    // MARK: Routing
    
    public func removeFromParent() {
        viewController?.navigationController?.popViewController(animated: true)
    }

    public func routeToGuestListViewController() {

        let destinationVC = GuestListViewController()
        viewController?.navigationController?.setViewControllers([destinationVC], animated: true)
    }

    public func routeToMeetingListViewController() {

        let destinationVC = MeetingListViewController()
        viewController?.navigationController?.setViewControllers([destinationVC], animated: true)
    }
}
