//
//  API.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 09/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

public struct API {
    let baseURL: BaseURL
    var path: [String]
    
    public init(baseURL: BaseURL, path: [String] = []) {
        self.baseURL = baseURL
        self.path = path
    }
}
