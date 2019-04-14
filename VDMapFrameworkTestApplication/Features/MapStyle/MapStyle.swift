//
//  MapStyle.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 14/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import GoogleMaps

protocol MapStyle {
    var mapView : GMSMapView!{ get }
    var mapType : MapType{ get set}
}

final class MapStyleImp : MapStyle{
    
    var mapView: GMSMapView!
    private var mapTypeManager : MapTypeManager?
    
    var mapType: MapType{
        get{
            return self.mapTypeManager?.getMapType() ?? .normal
        }
        set{
            self.mapTypeManager?.setType(type: newValue)
        }
    }
   
    init(mapView : GMSMapView) {
        self.mapView = mapView
        self.mapTypeManager = MapTypeManagerImp(mapView: self.mapView)//discuss krna hai

    }
    
}
