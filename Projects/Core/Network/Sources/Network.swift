//
//  Network.swift
//  Core
//
//  Created by Gunoo on 2022/07/09.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import Foundation
import UIKit
import NetworkProtocol

public final class Network: NetworkProtocol {
    
    private let session: URLSession
    
    public init(
        session: URLSession
    ) {
        self.session = session
    }
    
    public func send<T: Request>(_ request: T) async throws -> T.Output {
        let loadingActor = LoadingActor()
        return try await withCheckedThrowingContinuation { continuation in
            do {
                loadingActor.start()
                let urlRequest = try RequestFactory(request: request).makeURLRequest()
                let task = session.dataTask(with: urlRequest) { data, response, error in
                    if let error = error {
                        continuation.resume(with: .failure(error))
                        loadingActor.stop()
                        return
                    }
                    guard let data = data,
                          let httpResponse = response as? HTTPURLResponse,
                          (200..<400).contains(httpResponse.statusCode)
                    else {
                        print(response as! HTTPURLResponse)
                        continuation.resume(with: .failure(NetworkError.badServerResponse))
                        loadingActor.stop()
                        return
                    }
                    do {
                        let output = try JSONDecoder().decode(T.Output.self, from: data)
                        continuation.resume(with: .success(output))
                        loadingActor.stop()
                    } catch {
                        continuation.resume(with: .failure(error))
                        loadingActor.stop()
                    }
                }
                task.resume()
            } catch {
                continuation.resume(with: .failure(error))
                loadingActor.stop()
            }
        }
    }
    
//    func uploadImage(paramName: String, fileName: String, image: UIImage) {
//        let url = URL(string: "http://api-host-name/v1/api/uploadfile/single")
//
//        // generate boundary string using a unique per-app string
//        let boundary = UUID().uuidString
//
//        // Set the URLRequest to POST and to the specified URL
//        var urlRequest = URLRequest(url: url!)
//        urlRequest.httpMethod = "POST"
//
//        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
//        // And the boundary is also set here
//        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//
//        var data = Data()
//
//        // Add the image data to the raw http request data
//        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
//        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
//        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
//        data.append(image.pngData()!)
//
//        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
//
//        // Send a POST request to the URL, with the data we created earlier
//        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
//            if error == nil {
//                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
//                if let json = jsonData as? [String: Any] {
//                    print(json)
//                }
//            }
//        }).resume()
//    }
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
            let jsonEncoder = JSONEncoder()
            jsonEncoder.outputFormatting = .withoutEscapingSlashes
            let data = try jsonEncoder.encode(body)
            urlRequest.httpBody = data
        }
        if let multipartBody = request.multipartBody {
            urlRequest.httpBody = multipartBody
        }
        request.header.forEach {
            urlRequest.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        urlRequest.addValue(request.contentType, forHTTPHeaderField:"Content-Type")
        urlRequest.httpMethod = request.method.rawValue
        return urlRequest
    }
}
