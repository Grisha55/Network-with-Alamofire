//
//  ViewController.swift
//  Network with Alamofire
//
//  Created by Григорий Виняр on 17/06/2022.
//

import UIKit

class ViewController: UIViewController {

    private let url = "https://jsonplaceholder.typicode.com/posts"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        NetworkService.sendRequest(url: url) { posts in
            print(posts.first)
        }
    }


}

