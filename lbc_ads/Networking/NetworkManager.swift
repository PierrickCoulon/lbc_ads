//
//  NetworkManager.swift
//  lbc_ads
//
//  Created by Pierrick Coulon - Safeware on 21/11/2021.
//

import Foundation


enum HttpMethod: String {
    case GET = "GET"
}

enum NetworkError: Error {
    case invalidUrl
    case invalidData
}

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    func createRequest(for url: URL?, httpMethod: HttpMethod) -> URLRequest? {
        guard let url = url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    
    func executeRequest<T: Codable>(request: URLRequest, completion: ((T?, Error?) -> Void)?) {
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                completion?(nil, error)
                return
            }

            if let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
                DispatchQueue.main.async {
                    completion?(decodedResponse, nil)
                }
            } else {
                completion?(nil, NetworkError.invalidData)
            }
        }
        dataTask.resume()
    }
}
