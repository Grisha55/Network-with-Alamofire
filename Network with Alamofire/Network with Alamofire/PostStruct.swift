//
//  PostStruct.swift
//  
//
//  Created by Григорий Виняр on 17/06/2022.
//

import UIKit

struct Post {
    var body: String?
    var id: Int?
    var title: String?
    var userId: Int?
    
    init?(json: [String: Any]) {
        let body = json["body"] as? String
        let id = json["id"] as? Int
        let title = json["title"] as? String
        let userId = json["userId"] as? Int
        
        self.body = body
        self.id = id
        self.title = title
        self.userId = userId
    }
    
    static func getArray(from jsonArray: Any) -> [Post]? {
        
        guard let jsonArray = jsonArray as? Array<[String: Any]> else { return nil }
        return jsonArray.compactMap({ Post(json: $0) })
    }
}
