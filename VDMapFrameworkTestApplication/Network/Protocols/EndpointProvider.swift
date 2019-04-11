//
//  EndpointProvider.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 10/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

protocol EndpointProvider {
    
    associatedtype Response: DTO
    associatedtype Body: DTO
    associatedtype Failure: DTO
    
    var endpoint: Endpoint<Body> { get }
}
