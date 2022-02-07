//
//  URLSessionEx.swift
//  swift-essentials
//
//  Created by Nitesh  on 07/02/22.
//  Copyright © 2022 nitpa.org. All rights reserved.
//

import Foundation
import UIKit

enum URLSessionError: Error {
    case invalidURL
    case invalidData
}


/// Generic URL session extention
extension URLSession {
    
    func requestJSON<T: Decodable>(urlRequest: URLRequest?,
                                 expecting: T.Type,
                                 completion: @escaping (Result<T, URLSessionError>) -> Void) {
        
        guard let urlRequest = urlRequest else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared
        task.dataTask(with: urlRequest) { data, response, error in
            
            guard let data = data else {
                if let error = error {
                    completion(.failure(error as! URLSessionError))
                } else {
                    completion(.failure(.invalidData))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(expecting, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error as! URLSessionError))
            }
        }.resume()
    }
}


