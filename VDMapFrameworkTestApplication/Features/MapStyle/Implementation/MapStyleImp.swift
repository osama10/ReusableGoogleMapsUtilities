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
        get{ return self.mapTypeManager?.getVDMapType(type: self.mapView.mapType) ?? .normal
            
        }
        set{
            let type = self.mapTypeManager?.getGMSMapType(type: newValue)
            self.mapView.mapType = type ?? .normal
        }
    }
   
    init(mapView : GMSMapView, mapTypeManager : MapTypeManager = MapTypeManagerImp(), mapThemeManager : MapThemeManager = MapThemeManagerImp()) {
        self.mapView = mapView
        self.mapTypeManager = mapTypeManager
        self.mapThemeManager = mapThemeManager 
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
