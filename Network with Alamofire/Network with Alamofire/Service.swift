//
//  Service.swift
//  Network with Alamofire
//
//  Created by Григорий Виняр on 17/06/2022.
//

import UIKit
import Alamofire

class NetworkService {
    
    // MARK: - Put request
    static func putRequest(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .put, parameters: ["name": "Gregory"]).responseJSON { response in
            guard let statusCode = response.response?.statusCode else { return }
            print(statusCode)
            
            switch response.result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    // MARK: - Post request
    static func postRequest(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .post, parameters: ["Elena": "Hey, my name is Gregory and i'm the best programmer in the world"]).responseJSON { (response) in
            
            guard let statusCode = response.response?.statusCode else { return }
            print(statusCode)
            
            switch response.result {
            case .success(let data):
                
                AF.request(url, method: .get).responseJSON { response in
                    switch response.result {
                    case .success(let data):
                        print(data)
                    case .failure(let error):
                        print(error)
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    // MARK: - Get request
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
    
    // MARK: - Get image from url method
    static func fetchImage(url: String) {
        AF.request(url).responseData { (responseData) in
            switch responseData.result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                // do something
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Fetch data from the background
    static func donloadImageWithProgress(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url).validate().downloadProgress { progress in
            print(progress.totalUnitCount)
            print(progress.completedUnitCount)
            print(progress.fractionCompleted)
            print(progress.localizedDescription!)
        }.response { response in
            guard let data = response.data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                // do something
            }
        }
        
    }
    
}
