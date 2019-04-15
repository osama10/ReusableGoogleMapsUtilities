//
//  TrafficMonitoring.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 14/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import GoogleMaps

final class TrafficMonitoringImp : TrafficMonitoring{
    
    weak var mapView : GMSMapView!
    
    var isTrafficEnabled: Bool{
        get{
            return self.mapView.isTrafficEnabled
        }
        set{
            self.mapView.isTrafficEnabled = newValue
        }
    }
    
    init(mapView : GMSMapView) {
        self.mapView = mapView
    }
}
