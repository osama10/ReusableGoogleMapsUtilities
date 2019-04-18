//
//  Routing.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 12/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import GoogleMaps

protocol Routing {
    var mapView : GMSMapView{ get }
    func createPath(routingInfoDTO : RouteInfoDTO, width : CGFloat , color : UIColor, extraInfo : @escaping DirectionResultCompletion)
    func getDistanceData(routingInfoDTO : RouteInfoDTO , result : @escaping DistanceResultCompletion)
}


extension Routing{
    func createPath(routingInfoDTO : RouteInfoDTO, width : CGFloat = 6.0 , color : UIColor = .red, extraInfo : @escaping DirectionResultCompletion){
        
        createPath(routingInfoDTO: routingInfoDTO, width: width, color: color, extraInfo: extraInfo)
    }
}
