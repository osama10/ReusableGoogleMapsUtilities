//
//  MapType.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 14/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import GoogleMaps

protocol MapTypeManager  {
    var mapView : GMSMapView{ get }
    func setType(type : MapType)
    func getMapType()->MapType
}

final class MapTypeManagerImp : MapTypeManager{
    var mapView: GMSMapView
    
    init(mapView : GMSMapView) {
        self.mapView = mapView
    }
    
    func setType(type: MapType) {
        switch type {
        case .hybrid:
            self.mapView.mapType = .hybrid
        case .normal:
            self.mapView.mapType = .normal
        case .none:
            self.mapView.mapType = .none
        case .satellite:
            self.mapView.mapType = .satellite
        case .terrain:
            self.mapView.mapType = .terrain
        
        }
    }
    
    func getMapType()->MapType{
        var mapType : MapType!
        switch self.mapView.mapType {
        case .hybrid:
            mapType = .hybrid
        case .normal:
            mapType = .normal
        case .none:
            mapType = .none
        case .satellite:
            mapType = .satellite
        case .terrain:
            mapType = .terrain
            
        }
        
        return mapType
    }
}
