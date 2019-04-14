//
//  DirectionEndpointProvider.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 14/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

struct DirectionEndpointProvider : DTO {
    let requestObject : DirectionRequest
}

extension DirectionEndpointProvider : EndpointProvider{
    typealias Response = DirectionResponse
    
    typealias Body = EmptyDTO
    
    typealias Failure = RequestError
    
    var endpoint: Endpoint<Body>{
        return Endpoint(api: API.RoutingAPI.directions, method: .get, query: requestObject.dictionary as? QueryParams)
    }
    
    
}
