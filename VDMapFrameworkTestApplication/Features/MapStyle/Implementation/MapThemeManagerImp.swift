//
//  MapThemeManager.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 15/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import GoogleMaps

final class MapThemeManagerImp : MapThemeManager{
    
    func getDefaultTheme(theme: MapTheme) -> GMSMapStyle {
        return self.getThemeFrom(file: theme.rawValue, type: "json")!
    }
    
    func getThemeFrom(file name: String, type: String) -> GMSMapStyle? {
        var result : GMSMapStyle?
        do {
            if let styleURL = Bundle.main.url(forResource: name, withExtension: "json") {
                result = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                result = nil
            }
        } catch {
            result = nil
        }
        
        return result
    }
    
    func getThemeFrom(jsonString: String) -> GMSMapStyle? {
        var result : GMSMapStyle?
        
        do {
            result = try GMSMapStyle(jsonString: jsonString)
        } catch {
            result = nil
            
        }
        return result
    }
}
