//
//  MapTypeManagerTests.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 17/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import XCTest
@testable import VDMapFrameworkTestApplication
class MapTypeManagerTests: XCTestCase {

    var mapTypeManager : MapTypeManager!
    
    override func setUp() {
        mapTypeManager = MapTypeManagerImp()
        
    }

    func testGetVDMapType() {
       XCTAssertEqual(mapTypeManager.getVDMapType(type: .hybrid), .hybrid, "test failed")
        XCTAssertEqual(mapTypeManager.getVDMapType(type: .none), .none, "test failed")
        XCTAssertEqual(mapTypeManager.getVDMapType(type: .normal), .normal, "test failed")
        XCTAssertEqual(mapTypeManager.getVDMapType(type: .satellite), .satellite, "test failed")
        XCTAssertEqual(mapTypeManager.getVDMapType(type: .terrain), .terrain, "test failed")
        
    }

    func testGetGMSMapType() {
        XCTAssertEqual(mapTypeManager.getGMSMapType(type: .hybrid), .hybrid, "test failed")
        XCTAssertEqual(mapTypeManager.getGMSMapType(type: .none), .none, "test failed")
        XCTAssertEqual(mapTypeManager.getGMSMapType(type: .normal), .normal, "test failed")
        XCTAssertEqual(mapTypeManager.getGMSMapType(type: .satellite), .satellite, "test failed")
        XCTAssertEqual(mapTypeManager.getGMSMapType(type: .terrain), .terrain, "test failed")
        
    }
    
    

}
