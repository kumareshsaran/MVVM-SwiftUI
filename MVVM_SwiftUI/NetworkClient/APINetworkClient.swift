//
//  NetworkClient.swift
//  MVVM_SwiftUI
//
//  Created by kumersan on 10/24/24.
//

import Foundation
import Alamofire
import Combine

struct APINetworkClient: APINetWorkProvider {
    // Singleton instance of APINetworkClient
    static let instance = APINetworkClient()
    // Alamofire Session object for making network requests
    private let session: Session
    // Private initializer to ensure only one instance is created (Singleton pattern)
    private init() {
        session = Session.default // Initializes the session with default configuration
    }
    /// APINetworkClient will return the final API response as AnyPublisher<Data, Error>
    func requestInfo(_ info: RequestInfoConvertible) -> AnyPublisher<Data, Error> {
        debugPrint("\(info.asRequestInfo())")
        let requestinfo = info.asRequestInfo()
        return Future { promise in
            AF.request(
                requestinfo.convertibleUrl,
                method: requestinfo.method,
                parameters: requestinfo.parameters,
                encoding: requestinfo.encoding!,
                headers: requestinfo.headers,
                interceptor: requestinfo.interceptor,
                requestModifier: requestinfo.requestModifier
            )
            .validate()
            .responseData { response in
                debugPrint("\(String(reflecting: response.response?.statusCode))")
                switch response.result {
                case .success(let successResponse):
                    do {
                        let json = try JSONSerialization.jsonObject(with: successResponse, options: [])
                        print("Response JSON: \(json)")
                    } catch {
                        print("Failed to parse JSON: \(error.localizedDescription)")
                    }
                    promise(.success(successResponse))
                case .failure(let error):
                    promise(.failure(error))
                }
            }

        }.eraseToAnyPublisher()
    }
}
