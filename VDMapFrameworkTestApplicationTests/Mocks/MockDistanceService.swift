//
//  MockDistanceService.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 17/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//


import Foundation
@testable import VDMapFrameworkTestApplication

class MockDistanceService : DistanceServices{
    
    func getTimeAndDistance(routeInfoDTO: RouteInfoDTO, completion: @escaping DistanceResultCompletion) {
        completion(mockDistanceResult)
    }
    
    
}
