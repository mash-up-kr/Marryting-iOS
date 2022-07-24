//
//  GuestListRouter.swift
//  GuestList
//
//  Created by Gunoo on 2022/07/09.
//  Copyright (c) 2022 kr.mash-up. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import GuestListRoutingProtocol
import LikeRequestScene
import MyGuestListScene
import GuestDetailScene

public class GuestListRouter: GuestListRoutingLogic, GuestListDataPassing {
    public weak var viewController: UIViewController?
    public var dataStore: GuestListDataStore?
    
    public init() {}
    
    // MARK: Routing
    
    public func routeToLikeRequestScene(targetId id: Int) {
        guard let dataStore = dataStore,
              let guest = dataStore.guests.filter({ $0.user.id == id }).first else {
            return
        }
        let destinationVC = LikeRequestViewController()
        destinationVC.router?.dataStore?.targetGuest = guest
        viewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }

    public func routeToMyGuestListScene() {
        guard let dataStore = dataStore else {
            return
        }
        let destinationVC = MyGuestListViewController()
        viewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }

    public func routeToGuestDetailScene(targetId id: Int) {
        guard let dataStore = dataStore,
              let guest = dataStore.guests.filter({ $0.user.id == id }).first else {
            return
        }
        let destinationVC = GuestDetailViewController()
        destinationVC.router?.dataStore?.targetGuest = guest
        viewController?.navigationController?.pushViewController(destinationVC, animated: true)
    }
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: GuestListViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: GuestListDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
