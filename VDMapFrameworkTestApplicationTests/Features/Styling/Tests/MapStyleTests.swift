//
//  MapStyleTests.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 17/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import XCTest
import GoogleMaps

@testable import VDMapFrameworkTestApplication

class MapStyleTests: XCTestCase {
    var mapStyle : MapStyle!
    
    let mockThemeSuccessManager = MockMapThemeManager(themeManagerCase: .success)
    let mockThemeFailureManager = MockMapThemeManager(themeManagerCase: .failure)
    
    let mockTypeManager = MockMapTypeManager()
    
    let mapView = GMSMapView()
    
    override func setUp() {
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSetDefaultThemeSuccessFlow() {
        mapStyle = MapStyleImp(mapView: self.mapView, mapTypeManager: mockTypeManager, mapThemeManager: mockThemeSuccessManager)
        XCTAssertNotNil(mapStyle.setDefaultTheme(theme: .standard), "test failed")
    }
    

    func testSetThemeFromFileSuccessFlow(){
        mapStyle = MapStyleImp(mapView: self.mapView, mapTypeManager: mockTypeManager, mapThemeManager: mockThemeSuccessManager)
        
        XCTAssertNotNil(try? mapStyle.setThemeFrom(file: "StandardTheme", type: "json"), "test failed")

    }
    
    func testSetThemeFromStringSuccessFlow(){
        mapStyle = MapStyleImp(mapView: self.mapView, mapTypeManager: mockTypeManager, mapThemeManager: mockThemeSuccessManager)
        
        XCTAssertNotNil(try? mapStyle.setThemeFrom(jsonString: mockJsonString), "test failed")
        
    }
    
    func testSetThemeFromFileFailureFlow(){
        mapStyle = MapStyleImp(mapView: self.mapView, mapTypeManager: mockTypeManager, mapThemeManager: mockThemeFailureManager)
        
        XCTAssertNil(try? mapStyle.setThemeFrom(file: "StandardTheme", type: "json"), "test failed")
        
    }
    
    func testSetThemeFromStringFailureFlow(){
        mapStyle = MapStyleImp(mapView: self.mapView, mapTypeManager: mockTypeManager, mapThemeManager: mockThemeFailureManager)
        
        XCTAssertNil(try? mapStyle.setThemeFrom(jsonString: mockJsonString), "test failed")
        
    }
    
    func testMapType(){
        mapStyle = MapStyleImp(mapView: self.mapView, mapTypeManager: mockTypeManager, mapThemeManager: mockThemeFailureManager)
        
        mapStyle.mapType = .normal
        
        XCTAssertEqual(mapStyle.mapType, .normal, "failed")
        XCTAssertEqual(mapStyle.mapView.mapType, .normal, "failed")
    }

}
