//
//  NetworkProtocol.swift
//  Core
//
//  Created by Gunoo on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation

public protocol NetworkProtocol {
    func send<T: Request>(_ request: T) async throws -> T.Output
}
