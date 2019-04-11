//
//  RoutingResponse.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 10/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

struct RoutingResponse: DTO {
    
    let geocodedWaypoints: [GeocodedWaypoint]?
    let routes: [Route]?
    let status: String?
    let errorMessage : String?
    enum CodingKeys: String, CodingKey {
        case geocodedWaypoints = "geocoded_waypoints"
        case routes, status
        case errorMessage = "error_message"
    }
}

struct GeocodedWaypoint: DTO {
    let geocoderStatus, placeID: String?
    let types: [String]?
    let partialMatch: Bool?
    
    enum CodingKeys: String, CodingKey {
        case geocoderStatus = "geocoder_status"
        case placeID = "place_id"
        case types
        case partialMatch = "partial_match"
    }
}

struct Route: DTO {
    let bounds: Bounds?
    let copyrights: String?
    let overviewPolyline: OverviewPolyline?
    let summary: String?
    let warnings : [String]?
    let waypointOrder: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case bounds, copyrights
        case overviewPolyline = "overview_polyline"
        case summary, warnings
        case waypointOrder = "waypoint_order"
    }
}

struct Bounds: DTO {
    let northeast, southwest: Northeast?
}

struct Northeast: DTO {
    let lat, lng: Double?
}

struct OverviewPolyline: DTO {
    let points: String?
}
