//
//  Routing.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 10/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import GoogleMaps


public class RoutingImp : Routing{
    
    var mapView: GMSMapView
    private var routingService : RoutingService!
  
    init(mapView : GMSMapView, routingService : RoutingService = RoutingServiceImp()) {
        self.mapView = mapView
        self.routingService = routingService
    }
    
    func createPath(routingInfoDTO : RouteInfoDTO, width : CGFloat = 6.0, color : UIColor = .red, extraInfo : @escaping DirectionResultCompletion){
       
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
    
    func getTimeAndDistance(routingInfoDTO: RouteInfoDTO, result: @escaping DistanceResultCompletion) {
        self.routingService.getTimeAndDistance(routeInfoDTO: routingInfoDTO) { [weak self](response) in
            guard let self = self else { return }
            switch response{
            case .success(let data):
                self.handleSuccessFlowForDistanceCall(data: data, result: result)
            case .failure(let errorMessage):
                self.handleFailureFlowForDistanceCall(errorMessage: errorMessage, result: result)
            }
        }
    }
    
     private func handleSuccessFlowForDirectionCall(data : DirectionResponse, width : CGFloat, color : UIColor, extraInfo : @escaping DirectionResultCompletion){
        extraInfo(.success(data))
        data.routes?.forEach({ (route) in
            let points = route.overviewPolyline?.points
            self.createPathOnMap(points: points!, width: width, color: color, map: self.mapView)
        })
    }
    
    private func handleFailureFlowForDirectionCall(errorMessage : String, extraInfo : @escaping DirectionResultCompletion){
        extraInfo(.failure(errorMessage))
    }
    
    private func handleSuccessFlowForDistanceCall(data : DistanceData, result : @escaping DistanceResultCompletion){
        result(.success(data))
    }
    
    private func handleFailureFlowForDistanceCall(errorMessage : String, result : @escaping DistanceResultCompletion){
        result(.failure(errorMessage))
    }
    
    private func createPathOnMap(points : String, width : CGFloat, color : UIColor, map : GMSMapView){
        let path = GMSPath.init(fromEncodedPath: points)
        let singleLine = GMSPolyline.init(path: path)
        singleLine.strokeWidth = width
        singleLine.strokeColor = color
        singleLine.map = map
    }
    
 
}
