//
//  TestData.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 17/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import CoreLocation
@testable import VDMapFrameworkTestApplication

let origin = CLLocationCoordinate2D(latitude: 24.9207, longitude: 67.0882)
let destination = CLLocationCoordinate2D(latitude: 24.9204, longitude: 67.1344)

let mockRouteInfo = RouteInfoDTO(origin : origin, destination : destination , key : googleMapsApiKey, mode: .driving, alternatives: .no)

let mockDirectionResponse = DirectionResponse(geocodedWaypoints: nil, routes: nil, status: "DONE", errorMessage: nil)
let mockDirectionResult : DirectionsResult = .success(mockDirectionResponse)

let mockDistanceResponse = DistanceResponse(destinationAddresses: nil, originAddresses: nil, rows: nil, status: "DONE", errorMessage: nil)

let mockDistanceData = DistanceData(eta: 555, distance: 234)

let mockDistanceResult : DistanceResult = .success(mockDistanceData)

