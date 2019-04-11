//
//  RoutingService.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 10/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
typealias  DirectionResultCompletion = (DirectionsResult)->Void
protocol RoutingService {
    var networkManager : NetworkManager{ get }
    func getDirections(routeInfoDTO : RouteInfoDTO, completion : @escaping DirectionResultCompletion)
}


class RoutingServiceImp : RoutingService{
    
    var networkManager: NetworkManager
    
    init(networkManager : NetworkManager = URLSessionManager.shared) {
        self.networkManager = networkManager
    }
    
    func getDirections(routeInfoDTO: RouteInfoDTO, completion : @escaping DirectionResultCompletion) {
        
        
        let endpointProvider = getEndpointProvider(routeInfoDTO: routeInfoDTO)
      
        self.networkManager.request(endpointProvider) { [weak self](response) in
            guard let self = self else { return }

            let result =  self.parseResult(response: response)
            completion(result)
        }
    }
    
    private func parseResult(response : NetworkResult<RoutingResponse, RequestError, NetworkError>)->DirectionsResult{
        var result : DirectionsResult!
        
        switch response {
        case .success(let data):
            result = (data.status == "OK") ? .success(data) : .failure(data.errorMessage ?? "Someting went wrong. Please try later")
        case .failure(_):
            result = .failure("Someting went wrong. Please try later")
        case .error(_):
            result = .failure("Someting went wrong. Please try later")
        }
        
        return result
    }
    
    
    private func getEndpointProvider(routeInfoDTO : RouteInfoDTO)->RoutingEndpointProvider{
        let routeRequest = self.mapDTOtoRequest(routeInfoDTO: routeInfoDTO)
        return RoutingEndpointProvider(requestObject : routeRequest)
    }
    
    private func mapDTOtoRequest(routeInfoDTO : RouteInfoDTO)->RoutingRequest{
        let origin = "\(routeInfoDTO.origin.latitude),\(routeInfoDTO.origin.longitude)"
        let destination = "\(routeInfoDTO.destination.latitude),\(routeInfoDTO.destination.longitude)"
        let result = RoutingRequest(origin : origin, destination : destination, key : routeInfoDTO.key)
        return result
    }
}
