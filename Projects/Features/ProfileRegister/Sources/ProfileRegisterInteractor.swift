//
//  ProfileRegisterInteractor.swift
//  ProfileRegister
//
//  Created by Yoojin Park on 2022/07/09.
//  Copyright (c) 2022 kr.mash-up. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ProfileRegisterBusinessLogic
{
  func doSomething(request: ProfileRegister.Something.Request)
}

protocol ProfileRegisterDataStore
{
  //var name: String { get set }
}

class ProfileRegisterInteractor: ProfileRegisterBusinessLogic, ProfileRegisterDataStore
{
  var presenter: ProfileRegisterPresentationLogic?
  var worker: ProfileRegisterWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: ProfileRegister.Something.Request)
  {
    worker = ProfileRegisterWorker()
    worker?.doSomeWork()
    
    let response = ProfileRegister.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
