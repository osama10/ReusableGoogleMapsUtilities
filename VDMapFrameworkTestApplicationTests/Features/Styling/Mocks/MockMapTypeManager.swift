//
//  MockMapTypeManager.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 17/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
import GoogleMaps

@testable import VDMapFrameworkTestApplication

class MockMapTypeManager : MapTypeManager{
  
    func getGMSMapType(type: MapType) -> GMSMapViewType {
        return .normal
    }
    
    func getVDMapType(type: GMSMapViewType) -> MapType {
        return .normal
    }
    
    
}
