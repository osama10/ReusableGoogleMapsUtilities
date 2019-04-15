//
//  MapThemeManager.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 15/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import GoogleMaps

protocol MapThemeManager {
    func getDefaultTheme(theme : MapTheme)->GMSMapStyle
    func getThemeFrom(file name : String, type : String)->GMSMapStyle?
    func getThemeFrom(jsonString : String)->GMSMapStyle?
}
