//
//  APIRoutes.swift
//  MVVM_SwiftUI
//
//  Created by kumersan on 10/24/24.
//

import Foundation
import Alamofire

/// APIRoutes is confirmed with RequestInfoConvertible protocol. It will return the all parameter from RequestInfo class.
enum APIRoutes: RequestInfoConvertible {
    case login(email: String, passwd: String)
    func asRequestInfo() -> RequestInfo {
        switch self {
        case .login:
            return RequestInfo(convertibleUrl: apiURLString, method: .post, parameters: parameter(), encoding: JSONEncoding.default, headers: headers())
        }
    }
    /// baseURL retrun the API Base URL in String
    var baseURL: String {
        return "Your Base URL"
    }
    var apiURLString: String {
        return baseURL + urlPath()
    }
    /// urlPath will returnt the apsolute path for API request
    func urlPath() -> String {
        switch self {
        case .login:
            return "auth/login"
        }
    }
    /// It's retrun the [String: Any] parameter. It get the passed parameter from APIRoutes enum and form it to parameter formate
    func parameter() -> [String: Any] {
        switch self {
        case .login(email: let email, passwd: let password):
            return ["email": email, "password": password]
        }
    }
    func headers() -> HTTPHeaders {
        switch self {
        case .login:
            return [
                //"Authorization": userSetting.isUserLoggedIn,
                "Content-Type":"application/json"
            ]
        }
    }
}
