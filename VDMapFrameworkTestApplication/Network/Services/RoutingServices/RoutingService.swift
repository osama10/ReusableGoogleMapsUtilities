//
//  RoutingService.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 10/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

protocol RoutingService {
    func getDirections(routeInfoDTO : RouteInfoDTO, completion : @escaping DirectionResultCompletion)
    func getTimeAndDistance(routeInfoDTO : RouteInfoDTO, completion : @escaping DistanceResultCompletion)
}


class RoutingServiceImp : RoutingService{
    
    private var networkManager: NetworkManager
    private var directionServices : DirectionServices
    private var distanceServices : DistanceServices
    
    init(networkManager : NetworkManager = URLSessionManager.shared, directionServices : DirectionServices = DirectionServicesImp(), distanceServices : DistanceServices = DistanceServicesImp()) {
        
        self.networkManager = networkManager
        self.directionServices = directionServices
        self.distanceServices = distanceServices
    }
    
    func getDirections(routeInfoDTO: RouteInfoDTO, completion : @escaping DirectionResultCompletion) {
        
        self.directionServices.getDirections(routeInfoDTO: routeInfoDTO, completion: completion)
    }
    
    func getTimeAndDistance(routeInfoDTO: RouteInfoDTO, completion: @escaping DistanceResultCompletion) {
        self.distanceServices.getTimeAndDistance(routeInfoDTO: routeInfoDTO, completion: completion)
    }

}
