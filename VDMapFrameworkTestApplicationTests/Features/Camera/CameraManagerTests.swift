//
//  CameraManagerTests.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 24/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import XCTest
@testable import VDMapFrameworkTestApplication
import GoogleMaps

class CameraManagerTests: XCTestCase {
    var cameraManager : CameraManager!
    var cameraManagerImp : CameraManagerImp!
    
    override func setUp() {
        cameraManagerImp = CameraManagerImp(mapView: GMSMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)))
        cameraManager = cameraManagerImp
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSetCamera() {
        cameraManager.setCamera(withTarget: origin, zoom: 15.0)
        XCTAssertEqual(cameraManagerImp.mapView.camera.target.latitude, origin.latitude, "Test failed")
        XCTAssertEqual(cameraManagerImp.mapView.camera.zoom, 15.0, "Test failed")
        
        cameraManager.setCamera(withTarget: origin, zoom: 20, bearing: 20, viewingAngle: 20)
        XCTAssertEqual(cameraManagerImp.mapView.camera.target.latitude, origin.latitude, "Test failed")
        XCTAssertEqual(cameraManagerImp.mapView.camera.zoom, 20, "Test failed")
        XCTAssertEqual(cameraManagerImp.mapView.camera.bearing, 20, "Test failed")
        XCTAssertEqual(cameraManagerImp.mapView.camera.viewingAngle, 20, "Test failed")
        
        cameraManager.setCamera(withLatitude: 22, longitude: 22, zoom: 16.0)
        XCTAssertEqual(cameraManagerImp.mapView.camera.target.latitude, 22, "Test failed")
        XCTAssertEqual(cameraManagerImp.mapView.camera.zoom, 16.0, "Test failed")
        
        cameraManager.setCamera(withLatitude: 22, longitude: 22, zoom: 20, bearing: 20, viewingAngle: 20)
        XCTAssertEqual(cameraManagerImp.mapView.camera.target.latitude, 22, "Test failed")
        XCTAssertEqual(cameraManagerImp.mapView.camera.zoom, 20, "Test failed")
        XCTAssertEqual(cameraManagerImp.mapView.camera.bearing, 20, "Test failed")
        XCTAssertEqual(cameraManagerImp.mapView.camera.viewingAngle, 20, "Test failed")
        
        
        
    }
    
    func testAnimateMap(){
        cameraManager.animateMap(toZoom: 20)
        let zoom = cameraManagerImp.mapView.camera.zoom
        XCTAssertEqual(zoom, 20, "Test failed")

    }
    
}
