//
//  BaseResponse.swift
//  NetworkProtocol
//
//  Created by Woody on 2022/08/07.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

/// data가 String일 경우 Response
public struct BaseStringResponse: Response {
    public var status: Int
    public var data: String
}

/// Marryting Base Reponse
public struct BaseResponse<T: Response>: Response {
    public var status: Int
    public var data: T?
}
