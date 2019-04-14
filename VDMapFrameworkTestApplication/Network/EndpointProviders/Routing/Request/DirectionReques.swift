//
//  DirectionRequest.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 14/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

struct DistanceRequest : DTO{
    
    var origin : String
    var destination : String
    var key : String
    var mode : String
}
