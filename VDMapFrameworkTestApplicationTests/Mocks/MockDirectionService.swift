//
//  MockDirectionService.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 17/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
@testable import VDMapFrameworkTestApplication

class MockDirectionService : DirectionServices{
   
    func getDirections(routeInfoDTO: RouteInfoDTO, completion: @escaping DirectionResultCompletion) {
        completion(mockDirectionResult)
    }
    
    
}
