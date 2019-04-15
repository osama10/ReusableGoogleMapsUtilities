//
//  MapType.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 14/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import GoogleMaps

final class MapTypeManagerImp : MapTypeManager{

    func getGMSMapType(type : MapType)->GMSMapViewType{
        var mapType : GMSMapViewType!
        
        switch type {
        case .hybrid:
            mapType = .hybrid
        case .normal:
            mapType = .normal
        case .none:
            mapType = GMSMapViewType.none
        case .satellite:
           mapType = .satellite
        case .terrain:
            mapType = .terrain
        }
        
        return mapType
    }
    
    func getVDMapType(type : GMSMapViewType)->MapType{
        var mapType : MapType!
        
        switch type {
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
