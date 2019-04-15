//
//  MapStyle.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 14/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import GoogleMaps

final class MapStyleImp : MapStyle{
    
    var mapView: GMSMapView!
    private var mapTypeManager : MapTypeManager?
    private var mapThemeManager : MapThemeManager
    
    var mapType: MapType{
        get{ return self.mapTypeManager?.getMapType() ?? .normal }
        set{ self.mapTypeManager?.setType(type: newValue) }
    }
   
    init(mapView : GMSMapView) {
        self.mapView = mapView
        self.mapTypeManager = MapTypeManagerImp(mapView: self.mapView)
        self.mapThemeManager = MapThemeManagerImp() //discuss krna hai
    }
    
    func setDefaultTheme(theme: MapTheme) {
        let theme = self.mapThemeManager.getDefaultTheme(theme: theme)
        self.mapView.mapStyle = theme
    }
    
    func setThemeFrom(file name: String, type: String) throws{
        if let theme = self.mapThemeManager.getThemeFrom(file: name, type: type) {
            self.mapView.mapStyle = theme
        }else {
            throw MapFrameworkException.themeFileNotFoundError(themeFileNotFoundExceptionMessage)
        }
    }
    
    func setThemeFrom(jsonString: String) throws{
        if let theme = self.mapThemeManager.getThemeFrom(jsonString: jsonString){
            self.mapView.mapStyle = theme
        }else {
            throw MapFrameworkException.themeFileNotFoundError(themeFileNotFoundExceptionMessage)
        }
    }
    
    
}
