//
//  RoutingRequest.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 10/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

struct DirectionRequest : DTO{
    
    var origin : String
    var destination : String
    var key : String
    var mode : String
    var alternatives : String
}
