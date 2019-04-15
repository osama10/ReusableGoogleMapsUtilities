//
//  MapTypeManager.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 15/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import GoogleMaps

protocol MapTypeManager  {
    
    func getGMSMapType(type : MapType)->GMSMapViewType
     func getVDMapType(type : GMSMapViewType)->MapType
}