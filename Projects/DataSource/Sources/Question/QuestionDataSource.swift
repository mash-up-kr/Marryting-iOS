//
//  QuestionDataSource.swift
//  DataSource
//
//  Created by Woody on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol
import Network

public protocol QuestiondDataSourceProtocol {
    func getQuestions(request: GetQuestionsRequest) async throws -> GetQuestionsResponse
}

public final class QuestionDataSource: QuestiondDataSourceProtocol {

    private let network: NetworkProtocol

    public init(network: NetworkProtocol = Network(session: .shared)) {
        self.network = network
    }

    public func getQuestions(request: GetQuestionsRequest) async throws -> GetQuestionsResponse {
        try await network.send(request)
    }
}
