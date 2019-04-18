//
//  MapThemeManager.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 17/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import XCTest
@testable import VDMapFrameworkTestApplication

class MapThemeManagerTests: XCTestCase {
    
    var mapThemeManager : MapThemeManager!
    
    override func setUp() {
        mapThemeManager = MapThemeManagerImp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetThemeFromJsonStringSuccessFlow() {
        let result = mapThemeManager.getThemeFrom(jsonString: mockJsonString)
        XCTAssertNotNil(result, "test failed")
    }
    
    func testGetThemeFromJsonStringFailureFlow() {
        let result = mapThemeManager.getThemeFrom(jsonString: "")
        XCTAssertNil(result, "test failed")
        
    }
    
    func testGetDefaultTheme(){
        let result = mapThemeManager.getDefaultTheme(theme: .standard)
    
        XCTAssertNotNil(result, "failed")
    }
    
    func testGetThemeFromFileSuccessFlow(){
        let result = mapThemeManager.getThemeFrom(file: "StandardTheme", type: "json")
        XCTAssertNotNil(result, "failed")
    }
    
    func testGetThemeFromFileFaliureFlow(){
        let result1 = mapThemeManager.getThemeFrom(file: "no file", type: "json")
        let result2 = mapThemeManager.getThemeFrom(file: "DirectionMockData", type: "json")
        
        XCTAssertNil(result1, "test failed")
        XCTAssertNil(result2, "test failed")

    }
    
}
