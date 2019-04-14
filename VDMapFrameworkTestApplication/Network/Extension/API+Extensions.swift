//
//  API+Extensions.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 10/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation


extension API{
    struct RoutingAPI {
        static let directions = API(baseURL: .baseURL , path: ["maps", "api", "directions", "json"])
        static let distance = API(baseURL: .baseURL , path: ["maps", "api", "distancematrix", "json"])
    }
}
