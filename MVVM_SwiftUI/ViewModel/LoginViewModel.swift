//
//  LoginViewModel.swift
//  MVVM_SwiftUI
//
//  Created by kumersan on 10/24/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    var moduleViewModel: ModuleAPIClient = ModuleAPIClient()
    private var cancellables = Set<AnyCancellable>()
    func login(email: String, password: String, completion: @escaping (()->())) {
        moduleViewModel.login(email: email, password: password)
            .replaceError(with: nil)
            .sink { response in
                print("\(String(describing: response))")
                completion()
            }
            .store(in: &cancellables)
    }
}
