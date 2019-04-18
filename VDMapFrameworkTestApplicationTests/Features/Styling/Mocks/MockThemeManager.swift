//
//  MockThemeManager.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 17/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import GoogleMaps

@testable import VDMapFrameworkTestApplication

enum MapThemeManagerFlow{
    case success, failure
}

class MockMapThemeManager : MapThemeManager{
   
    var theme : GMSMapStyle!
    var themeManagerCase : MapThemeManagerFlow
    
    init(themeManagerCase : MapThemeManagerFlow) {
        self.themeManagerCase = themeManagerCase
    }
    
    func getDefaultTheme(theme: MapTheme) -> GMSMapStyle {
        self.theme = self.getGMSMapStlye()
        return self.theme
    }
    
    func getThemeFrom(file name: String, type: String) -> GMSMapStyle? {
         self.theme = self.getGMSMapStlye()
        return (themeManagerCase == .success ) ? self.theme : nil

    }
    
    func getThemeFrom(jsonString: String) -> GMSMapStyle? {
         self.theme = self.getGMSMapStlye()
        return (themeManagerCase == .success ) ? self.theme : nil

    }
    
    
    private func getGMSMapStlye()->GMSMapStyle{
       
        var result : GMSMapStyle?
        do {
            if let styleURL = Bundle.main.url(forResource: "StandardTheme", withExtension: "json") {
                result = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                result = nil
            }
        } catch {
            result = nil
        }
        
        return result!
    }
    
    
    
}
