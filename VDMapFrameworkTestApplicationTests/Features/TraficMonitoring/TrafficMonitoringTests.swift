//
//  TrafficMonitoringTests.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 18/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import XCTest
import GoogleMaps
@testable import VDMapFrameworkTestApplication

class TrafficMonitoringTests: XCTestCase {
    
    var trafficMonitoring : TrafficMonitoring!
    
    override func setUp() {
        
    }


    func testIsTrafficEnabled() {
        let mapView = GMSMapView()
        let trafficMonitoringImp = TrafficMonitoringImp(mapView: mapView)
        trafficMonitoring = trafficMonitoringImp
       
        trafficMonitoring.isTrafficEnabled = true
       
        XCTAssertTrue(trafficMonitoring.isTrafficEnabled, "test failed")
        XCTAssertEqual(trafficMonitoringImp.mapView.isTrafficEnabled,true , "test failed")
        
        trafficMonitoring.isTrafficEnabled = false
        XCTAssertFalse(trafficMonitoring.isTrafficEnabled, "test failed")
        XCTAssertEqual(trafficMonitoringImp.mapView.isTrafficEnabled,false , "true")

    }



}
