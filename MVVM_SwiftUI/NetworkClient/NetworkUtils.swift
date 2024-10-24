//
//  NetworkUtils.swift
//  MVVM_SwiftUI
//
//  Created by kumersan on 10/24/24.


import Foundation
import Combine

enum NetworkError: Error {
    case invalidResponse
    case invalidInput
    case invalidJSON
    case other(Error)
}

extension AnyPublisher where Output == Data, Failure == Error {
    func jsonObject() -> AnyPublisher<[String: Any], Failure> {
        tryMap { data -> [String: Any] in
            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                return jsonObject
            }
            throw NetworkError.invalidJSON
        }.eraseToAnyPublisher()
    }
    func jsonObjects() -> AnyPublisher<[[String: Any]], Failure> {
        tryMap { data -> [[String: Any]] in
            if let jsonObjects = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                return jsonObjects
            }
            throw NetworkError.invalidJSON
        }.eraseToAnyPublisher()
    }
    /// decode function will convert from AnyPublisher<Data, Error> to AnyPublisher<T, Error> T - is Generic class which Response Model.
    func decode<T: Decodable>(jsonDecoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {
            tryMap { data -> T in
                do {
                    return try jsonDecoder.decode(T.self, from: data)
                } catch let error {
                    debugPrint("******decode error***** \n \(error)")
                    throw error
                }
            }
            .mapError { error -> Error in
                return error
            }
            .eraseToAnyPublisher()
        }
//    func decode<T: Decodable>(jsonDecoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Failure> {
//            tryMap { data -> T in
//                return try jsonDecoder.decode(T.self, from: data)
//            }.eraseToAnyPublisher()
//        }
}
