//
//  Network.swift
//  Core
//
//  Created by Gunoo on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation
import NetworkProtocol

public final class Network: NetworkProtocol {
    
    private let session: URLSession
    
    public init(
        session: URLSession
    ) {
        self.session = session
    }
    
    public func send<T: Request>(_ request: T) async throws -> T.Output {
        try await withCheckedThrowingContinuation { continuation in
            do {
                let urlRequest = try RequestFactory(request: request).makeURLRequest()
                let task = session.dataTask(with: urlRequest) { data, response, error in
                    if let error = error {
                        continuation.resume(with: .failure(error))
                        return
                    }
                    guard let data = data,
                          let httpResponse = response as? HTTPURLResponse,
                          (200..<400).contains(httpResponse.statusCode)
                    else {
                        continuation.resume(with: .failure(NetworkError.badServerResponse))
                        return
                    }
                    do {
                        let output = try JSONDecoder().decode(T.Output.self, from: data)
                        continuation.resume(with: .success(output))
                    } catch {
                        continuation.resume(with: .failure(error))
                    }
                }
                task.resume()
            } catch {
                continuation.resume(with: .failure(error))
            }
        }
    }
}

private final class RequestFactory<T: Request> {
    
    let request: T
    private var urlComponents: URLComponents?
    
    init(request: T) {
        self.request = request
        if let url = URL(string: request.baseURL + request.endpoint) {
            self.urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        }
    }
    
    func makeURLRequest() throws -> URLRequest {
        if request.query.isEmpty == false {
            urlComponents?.queryItems = request.query.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        guard let url = urlComponents?.url else {
            throw NetworkError.invalidURL(url: request.endpoint)
        }
        var urlRequest = URLRequest(url: url)
        if let body = request.body {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        }
        request.header.forEach {
            urlRequest.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        urlRequest.httpMethod = request.method.rawValue
        return urlRequest
    }
}
