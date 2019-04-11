//
//  RoutingEndpointProvider.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 11/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

struct RoutingEndpointProvider : DTO {
    let requestObject : RoutingRequest
}

extension RoutingEndpointProvider : EndpointProvider{
    typealias Response = RoutingResponse
    
    typealias Body = EmptyDTO
    
    typealias Failure = RequestError
    
    var endpoint: Endpoint<Body>{
        return Endpoint(api: API.RoutingAPI.directions, method: .get, query: requestObject.dictionary as? QueryParams)
    }
    
    
}
