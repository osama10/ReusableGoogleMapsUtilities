//
//  MockRoutingService.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 18/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
@testable import VDMapFrameworkTestApplication

enum MockRoutingServiceCase{
    case success, error
}

class MockRoutingService : RoutingService{
    
    let serviceCase : MockRoutingServiceCase
    
    init(serviceCase : MockRoutingServiceCase) {
        self.serviceCase = serviceCase
    }
   
    func getDirections(routeInfoDTO: RouteInfoDTO, completion: @escaping DirectionResultCompletion) {
        switch serviceCase {
        case .success:
            completion(.success(mockDirectionResponse))
        case .error:
            completion(.failure(somethingWentWrongErrorMessage))
        }
    }
    
    func getTimeAndDistance(routeInfoDTO: RouteInfoDTO, completion: @escaping DistanceResultCompletion) {
        switch serviceCase {
        case .success:
            completion(.success(mockDistanceData))
        case .error:
            completion(.failure(somethingWentWrongErrorMessage))
        }
    }
    
    
}
