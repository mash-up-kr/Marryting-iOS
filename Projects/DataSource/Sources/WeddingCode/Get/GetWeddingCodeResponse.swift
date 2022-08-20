//
//  GetWeddingCodeResponse.swift
//  DataSource
//
//  Created by 박건우 on 2022/08/20.
//  Copyright © 2022 kr.mash-up. All rights reserved.
//

import NetworkProtocol

public typealias GetWeddingCodeResponse = BaseResponse<GetWeddingCodeResponseBody>

public struct GetWeddingCodeResponseBody: Response {
    public let weddingId: Int
}
