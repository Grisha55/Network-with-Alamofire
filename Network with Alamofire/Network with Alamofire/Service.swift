//
//  Service.swift
//  Network with Alamofire
//
//  Created by Григорий Виняр on 17/06/2022.
//

import UIKit
import Alamofire

class NetworkService {
    
    static func sendRequest(url: String, completion: @escaping ([Post]) -> Void) {
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .get).validate().responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                guard let posts = value as? Array<[String: Any]> else { return }
                
                guard let finishArr = Post.getArray(from: posts) else { return }
                
                completion(finishArr)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }.resume()
        
    }
    
}
