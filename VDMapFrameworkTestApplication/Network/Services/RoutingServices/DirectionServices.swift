//
//  DirectionServices.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 14/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

typealias  DirectionResultCompletion = (DirectionsResult)->Void

protocol DirectionServices {
    func getDirections(routeInfoDTO : RouteInfoDTO, completion : @escaping DirectionResultCompletion)
 }

final class DirectionServicesImp : DirectionServices{
  
    private var networkManager: NetworkManager
    
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
    

    private func parseResult(response : NetworkResult<DirectionResponse, RequestError, NetworkError>)->DirectionsResult{
        var result : DirectionsResult!
        
        switch response {
        case .success(let data):
            result = (data.status == "OK") ? .success(data) : .failure(data.errorMessage ?? somethingWentWrongErrorMessage)
        case .failure(_):
            result = .failure(somethingWentWrongErrorMessage)
        case .error(_):
            result = .failure(somethingWentWrongErrorMessage)
        }
        
        return result
    }
    
    
    private func getEndpointProvider(routeInfoDTO : RouteInfoDTO)->DirectionEndpointProvider{
        let routeRequest = self.mapDTOtoRequest(routeInfoDTO: routeInfoDTO)
        return DirectionEndpointProvider(requestObject : routeRequest)
    }
    
    private func mapDTOtoRequest(routeInfoDTO : RouteInfoDTO)->DirectionRequest{
        let origin = "\(routeInfoDTO.origin.latitude),\(routeInfoDTO.origin.longitude)"
        let destination = "\(routeInfoDTO.destination.latitude),\(routeInfoDTO.destination.longitude)"
        let result = DirectionRequest(origin : origin, destination : destination, key : routeInfoDTO.key, mode : routeInfoDTO.mode?.rawValue ?? "driving", alternatives : routeInfoDTO.alternatives?.rawValue ?? "false")
        return result
    }
}
