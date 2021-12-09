//
//  Request.swift
//  Skincare
//
//  Created by Gabriel Batista Cristiano on 07/12/21.
//

import Foundation
import UIKit

class Request {

    public func getData(from url: String, _ completion: @escaping (Result<[Product], Error>) -> Void){
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            guard let data = data, error == nil else{
                print("Algo de errado não esta certo.")
                return
            }
            
            var result: [Product]
            do {
                result = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(result))
            } catch {
                print("Falha na conversão: \(error)")
                completion(.failure(error))
            }
            
            
        }).resume()
    }

}

