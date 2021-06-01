//
//  KanyeQuoteManager.swift
//  swift-essentials
//
//  Created by Nitesh  on 01/06/21.
//  Copyright © 2021 nitpa.org. All rights reserved.
//

import Foundation

enum UMError: String, Error {
    case errorSession = "Unable to decode error"
    case errorResponse = "Enable to response error"
    case errorStatusCode = "Status is not 200..299"
    case errorData = "Invalid data"
    case errorDecoding = "Unable to decode data"
}

class KanyeQuoteManager {
    
    static let shared = KanyeQuoteManager()
    
    private let session: URLSession
    
    private init() {
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
    
    func getKanyeQuote(completion: @escaping (Result<Kanye, UMError>) -> Void ) {
        let url = URL(string: "https://api.kanye.rest/")
    
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("initial error,\(error)")
                completion(.failure(.errorSession))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.errorResponse))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.errorStatusCode))
                return
            }
            
            guard let data = data else {
                completion(.failure(.errorData))
                return
            }
            
            do {
                let kanye = try JSONDecoder().decode(Kanye.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(kanye))
                }
            } catch {
                completion(.failure(.errorDecoding))
            }
        }.resume()
    }
}

struct Kanye: Decodable {
    let quote: String
}

