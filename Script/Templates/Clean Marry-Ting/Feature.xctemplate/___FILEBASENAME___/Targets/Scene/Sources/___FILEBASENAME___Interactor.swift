//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import ___VARIABLE_sceneName___RoutingProtocol
import Models

protocol ___VARIABLE_sceneName___BusinessLogic {}

final class ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___BusinessLogic, ___VARIABLE_sceneName___DataStore {
    var presenter: ___VARIABLE_sceneName___PresentationLogic?
    var worker: ___VARIABLE_sceneName___WorkerProtocol?
    
    init(worker: ___VARIABLE_sceneName___WorkerProtocol = ___VARIABLE_sceneName___Worker()) {
        self.worker = worker
    }
    
    // MARK: Business Logic
    
    
}