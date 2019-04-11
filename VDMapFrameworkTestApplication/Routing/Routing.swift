//
//  Routing.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 10/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import GoogleMaps


protocol Routing {
    var mapView : GMSMapView{ get }
    func createPath(routingInfoDTO : RouteInfoDTO, width : CGFloat , color : UIColor, extraInfo : @escaping ExtraRouteInfo)
}


public class RoutingImp : Routing{
    
    var mapView: GMSMapView
   
    private var routingService : RoutingService!
  
    init(mapView : GMSMapView, routingService : RoutingService = RoutingServiceImp()) {
        self.mapView = mapView
        self.routingService = routingService
    }
    
    func createPath(routingInfoDTO : RouteInfoDTO, width : CGFloat = 6.0, color : UIColor = .red, extraInfo : @escaping ExtraRouteInfo){
       
        routingService.getDirections(routeInfoDTO: routingInfoDTO) { [weak self](result) in
            guard let self = self else { return }
           
            switch result{
            case .success(let data):
                self.handleSuccessFlowForDirectionCall(data: data, width: width , color: color, extraInfo: extraInfo)
            case .failure(let errorMessage):
                self.handleFailureFlowForDirectionCall(errorMessage: errorMessage, extraInfo: extraInfo)
            }
        }
    }
    
     private func handleSuccessFlowForDirectionCall(data : RoutingResponse, width : CGFloat, color : UIColor, extraInfo : @escaping ExtraRouteInfo){
        extraInfo(data)
        data.routes?.forEach({ (route) in
            let points = route.overviewPolyline?.points
            self.createPathOnMap(points: points!, width: width, color: color, map: self.mapView)
        })
    }
    
    
    private func createPathOnMap(points : String, width : CGFloat, color : UIColor, map : GMSMapView){
        let path = GMSPath.init(fromEncodedPath: points)
        let singleLine = GMSPolyline.init(path: path)
        singleLine.strokeWidth = width
        singleLine.strokeColor = color
        singleLine.map = map
    }
    
    private func handleFailureFlowForDirectionCall(errorMessage : String, extraInfo : @escaping ExtraRouteInfo){
        extraInfo(nil)
        // to be discussed with the team
    }
}
