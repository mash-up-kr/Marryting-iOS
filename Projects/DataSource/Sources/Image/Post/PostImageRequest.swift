//
//  PostImageRequest.swift
//  DataSource
//
//  Created by 박건우 on 2022/08/23.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation
import NetworkProtocol

public struct PostImageRequest: Request {

    public typealias Body = EmptyRequestBody

    public typealias Output = BaseStringResponse

    public var endpoint: String = "/api/v1/profile/image"

    public var method: HTTPMethod = .post
    
    public var contentType: String = "multipart/form-data"
    
    public var multipartBody: Data

    public init(imageData: Data) {
        multipartBody = imageData
    }
}
