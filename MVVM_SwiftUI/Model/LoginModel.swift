//
//  LoginModel.swift
//  MVVM_SwiftUI
//
//  Created by kumersan on 10/24/24.
//

import Foundation

struct LoginResponse: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id
        case success
        case statusCode
        case data
    }
    var success: Bool?
    var statusCode: Int?
    var data: LoginData?
    var id: Int?
}


struct LoginData: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case message
        case accessToken = "access_token"
        case id
    }
    var message, accessToken: String?
    var id: Int?
}
