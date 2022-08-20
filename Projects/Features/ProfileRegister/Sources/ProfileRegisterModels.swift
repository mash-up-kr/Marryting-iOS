//
//  ProfileRegisterModels.swift
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

enum ProfileRegister
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request
    {
    }
    struct Response
    {
    }
    struct ViewModel
    {
    }
  }
}

struct CreateProfileRequestDTO {
    var name: String
    var gender: String
    var birth: String
    var address: String
    var career: String
    var answers: [Answer]
    var keywords: [Keyword]
    var pictures: [UIImage]
    
    init(name: String = "", gender: String = "", birth: String = "", address: String = "", career: String = "", answers: [Answer] = [], keywords: [Keyword] = [], pictures: [UIImage] = []) {
        self.name = name
        self.gender = gender
        self.birth = birth
        self.address = address
        self.career = career
        self.answers = answers
        self.keywords = keywords
        self.pictures = pictures
    }
}

struct Answer {
    var answer: String
    var questionId: String
}

struct Keyword {
    var keyword: String
    var keywordId: String
}

struct UserInfo {
    var name: String
    var gender: String
    var birth: String
    var address: String
    var job: String
    
    init(name: String = "", gender: String = "", birth: String = "", address: String = "", job: String = "") {
        self.name = name
        self.gender = gender
        self.birth = birth
        self.address = address
        self.job = job
    }
}
