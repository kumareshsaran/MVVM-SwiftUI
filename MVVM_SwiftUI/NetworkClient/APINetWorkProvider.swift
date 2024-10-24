//
//  APINetWorkProvider.swift
//  MVVM_SwiftUI
//
//  Created by kumersan on 10/24/24.
//

import Foundation
import Combine
import Alamofire

/// APINetWorkProvider protocol will retrun the AnyPublisher<Data, Error>. it wil get all paramters from RequestInfoConvertible protocol.
protocol APINetWorkProvider {
    func requestInfo(_ info: RequestInfoConvertible) -> AnyPublisher<Data, Error>
}

/// RequestInfoConvertible return the RequestInfo class. RequestInfo contains parameter for API requesr
protocol RequestInfoConvertible {
    func asRequestInfo() -> RequestInfo
}

/// RequestInfo will retrunt the parameter which are all request to hit the alamofire request. (i.e) URL, methods, paramter and etc ..
struct RequestInfo {
        var convertibleUrl: URLConvertible
        var method: HTTPMethod
        var parameters: Parameters? = [String: Any]()
        var encoding: ParameterEncoding? = JSONEncoding.default
        var headers: HTTPHeaders? = HTTPHeaders.default
        var interceptor: RequestInterceptor?
        var requestModifier: Session.RequestModifier?
    init(convertibleUrl: URLConvertible, method: HTTPMethod, parameters: Parameters? = nil, encoding: ParameterEncoding, headers: HTTPHeaders? = nil, interceptor: RequestInterceptor? = nil, requestModifier: Session.RequestModifier? = nil) {
        self.convertibleUrl = convertibleUrl
        self.method = method
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
        self.interceptor = interceptor
        self.requestModifier = requestModifier
    }
}
