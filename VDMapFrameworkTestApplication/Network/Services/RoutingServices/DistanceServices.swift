//
//  DistanceServices.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 14/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation


typealias  DistanceResultCompletion = (DistanceResult)->Void

protocol DistanceServices {
    func getTimeAndDistance(routeInfoDTO : RouteInfoDTO, completion : @escaping DistanceResultCompletion)
}

final class DistanceServicesImp : DistanceServices{
 
    private var networkManager: NetworkManager
    
    init(networkManager : NetworkManager = URLSessionManager.shared) {
        self.networkManager = networkManager
    }
    
    func getTimeAndDistance(routeInfoDTO: RouteInfoDTO, completion: @escaping DistanceResultCompletion) {
        let endpointProvider = self.getEndpointProvider(routeInfoDTO: routeInfoDTO)
       
        self.networkManager.request(endpointProvider) { [weak self](response) in
            guard let self = self else { return }
            let result = self.parseResult(response: response)
            completion(result)
        }
    }
   
    private func parseResult(response : NetworkResult<DistanceResponse, RequestError, NetworkError>)->DistanceResult{
        var result : DistanceResult!
        
        switch response {
        case .success(let data):
            result = (data.status == "OK") ? .success(self.mapDistanceResponseToDistanceData(distanceResponse: data)) : .failure(data.errorMessage ?? somethingWentWrongErrorMessage)
        case .failure(_):
            result = .failure(somethingWentWrongErrorMessage)
        case .error(_):
            result = .failure(somethingWentWrongErrorMessage)
        }
        
        return result
    }
    
    
    private func getEndpointProvider(routeInfoDTO : RouteInfoDTO)->DistanceEndpointProvider{
        let routeRequest = self.mapDTOtoRequest(routeInfoDTO: routeInfoDTO)
        return DistanceEndpointProvider(requestObject : routeRequest)
    }
    
    private func mapDTOtoRequest(routeInfoDTO : RouteInfoDTO)->DistanceRequest{
        let origin = "\(routeInfoDTO.origin.latitude),\(routeInfoDTO.origin.longitude)"
        let destination = "\(routeInfoDTO.destination.latitude),\(routeInfoDTO.destination.longitude)"
        let result = DistanceRequest(origins : origin, destinations : destination, key : routeInfoDTO.key, mode : routeInfoDTO.mode?.rawValue ?? "driving")
        return result
    }
    
    private func mapDistanceResponseToDistanceData(distanceResponse : DistanceResponse)->DistanceData{
        
        let elements = distanceResponse.rows.map{$0.elements}.flatMap{ $0 }
        
        let distance = elements.reduce(0){ (result, next) -> Double in
            return result + Double(next.distance.value)
        }
        let eta = elements.reduce(0){ (result, next) -> Double in
            return result + Double(next.duration.value)
        }
        
        return DistanceData(eta : eta, distance : distance)
    }
}
