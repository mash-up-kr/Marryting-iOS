//
//  NetworkError.swift
//  NetworkProtocol
//
//  Created by Gunoo on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL(url: String?)
    case badServerResponse
}
