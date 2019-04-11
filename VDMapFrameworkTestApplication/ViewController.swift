//
//  ViewController.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 09/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = RoutingRequest(origin : "24.333", destination : "25.999", key : googleMapsApiKey)
        let enpoingProvider = RoutingEndpointProvider(requestObject : request)
        
        URLSessionManager.shared.request(enpoingProvider) { (result) in
            switch result {
            case .success(let data):
                print(data.status)
            case .failure(let error):
                print(error.localizedDescription)
            case .error(let failure):
                print(failure.localizedDescription)
            }
        }
    }


}

