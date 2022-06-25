//
//  NetworkManager.swift
//  PhonePeTest
//
//  Created by Ankush Gupta on 25/06/22.
//

import UIKit

public enum Result<T> {
    case success(T)
    case failure(Error)
}

final class NetworkManager: NSObject {
    
    private static func getData(url: URL,
                                completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    public static func downloadImage(url: URL,
                                     completion: @escaping (Result<Data>) -> Void) {
        NetworkManager.getData(url: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async() {
                completion(.success(data))
            }
        }
    }
}
