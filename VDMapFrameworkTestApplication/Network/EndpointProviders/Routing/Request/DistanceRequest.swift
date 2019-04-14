//
//  DistanceRequest.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 14/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
struct DistanceRequest : DTO{
    
    var origins : String
    var destinations : String
    var key : String
    var mode : String
}
