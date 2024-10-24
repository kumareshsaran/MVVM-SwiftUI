//
//  ModuleAPIProvider.swift
//  MVVM_SwiftUI
//
//  Created by kumersan on 10/24/24.
//

import Foundation
import Combine

protocol ModuleAPIProvider {
    func login(email: String, password: String) -> AnyPublisher<LoginResponse?, Error>
}

class ModuleAPIClient: ModuleAPIProvider {
    var apiNetWorkClient: APINetworkClient = APINetworkClient.instance
    func login(email: String, password: String) -> AnyPublisher<LoginResponse?, Error> {
        return apiNetWorkClient.requestInfo(APIRoutes.login(email: email, passwd: password)).decode()
    }
}
