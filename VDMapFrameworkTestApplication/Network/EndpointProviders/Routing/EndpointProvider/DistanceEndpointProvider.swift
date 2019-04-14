//
//  RoutingEndpointProvider.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 11/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

struct DistanceEndpointProvider : DTO {
    let requestObject : DistanceRequest
}

extension DistanceEndpointProvider : EndpointProvider{
    typealias Response = DistanceResponse
    
    typealias Body = EmptyDTO
    
    typealias Failure = RequestError
    
    var endpoint: Endpoint<Body>{
        return Endpoint(api: API.RoutingAPI.distance, method: .get, query: requestObject.dictionary as? QueryParams)
    }
    
    
}
