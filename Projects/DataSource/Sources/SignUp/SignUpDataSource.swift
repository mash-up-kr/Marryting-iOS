//
//  SignUpDataSource.swift
//  DataSource
//
//  Created by 박건우 on 2022/08/23.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Network

public protocol SignUpDataSourceProtocol {
    func postSignUp(request: PostSignUpRequest) async throws -> PostSignUpResponse
}

public final class SignUpDataSource: SignUpDataSourceProtocol {

    private let network: NetworkProtocol

    public init(network: NetworkProtocol = Network(session: .shared)) {
        self.network = network
    }

    public func postSignUp(request: PostSignUpRequest) async throws -> PostSignUpResponse {
        try await network.send(request)
    }
}
