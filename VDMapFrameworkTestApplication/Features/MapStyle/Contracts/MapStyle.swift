//
//  MapStyle.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 15/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import GoogleMaps

protocol MapStyle {
    var mapView : GMSMapView!{ get }
    var mapType : MapType{ get set}
    
    func setDefaultTheme(theme : MapTheme)
    func setThemeFrom(file name : String, type : String) throws
    func setThemeFrom(jsonString : String) throws
}
