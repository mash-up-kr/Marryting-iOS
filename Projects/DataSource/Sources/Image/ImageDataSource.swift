//
//  ImageDataSource.swift
//  DataSource
//
//  Created by 박건우 on 2022/08/23.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation
import NetworkProtocol
import Network

public protocol ImageDataSourceProtocol {
    func postImage(request: PostImageRequest) async throws -> BaseStringResponse
}

public final class ImageDataSource: ImageDataSourceProtocol {

    private let network: NetworkProtocol

    public init(network: NetworkProtocol = Network(session: .shared)) {
        self.network = network
    }

    public func postImage(request: PostImageRequest) async throws -> BaseStringResponse {
        try await network.send(request)
    }
}
