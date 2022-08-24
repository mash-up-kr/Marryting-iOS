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
import Alamofire

public protocol ImageDataSourceProtocol {
    func postImage(request: PostImageRequest) async throws -> BaseStringResponse
}

public final class ImageDataSource: ImageDataSourceProtocol {

    private let network: NetworkProtocol

    public init(network: NetworkProtocol = Network(session: .shared)) {
        self.network = network
    }

    public func postImage(request: PostImageRequest) async throws -> BaseStringResponse {
        try await alamofireRequest(request: request)
    }

    private func alamofireRequest(request: PostImageRequest) async throws -> PostImageRequest.Output {
        try await withUnsafeThrowingContinuation { continuation in
            AF.upload(multipartFormData: { multipartFormData in
                multipartFormData.append(request.multipartBody, withName: "image", fileName: "file.jpeg", mimeType: "image/jpeg")

            }, to: request.baseURL + request.endpoint, usingThreshold: UInt64.init(), method: .post,  headers: ["contentType": request.contentType]
            )
            .validate()
            .responseData { response in
                if let err = response.error {
                    continuation.resume(throwing: err)
                }
                guard let data = response.data else {
                    continuation.resume(throwing: NetworkError.badServerResponse)
                    return
                }

                do {
                    let imageURL = try JSONDecoder().decode(PostImageRequest.Output.self, from: data)
                    continuation.resume(returning: imageURL)
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
