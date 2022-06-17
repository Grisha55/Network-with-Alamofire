//
//  ViewController.swift
//  Network with Alamofire
//
//  Created by Григорий Виняр on 17/06/2022.
//

import UIKit

class ViewController: UIViewController {

    private let url = "https://jsonplaceholder.typicode.com/posts"
    private let urlForPutRequest = "https://jsonplaceholder.typicode.com/posts/1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        NetworkService.putRequest(url: urlForPutRequest)
    }


}

