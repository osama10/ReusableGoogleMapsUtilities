//
//  RoutingTests.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 18/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import XCTest
import GoogleMaps
@testable import VDMapFrameworkTestApplication

class RoutingTests: XCTestCase {
    
    var routing : Routing!
    
    override func setUp() {
        
    }
    
    func testCreatePathSuccesFlow() {
        let expectations = self.expectation(description: "Testing expectations")
        let routingServices = MockRoutingService(serviceCase: .success)
        routing = RoutingImp(mapView: GMSMapView(), routingService: routingServices)
        routing.createPath(routingInfoDTO: mockRouteInfo , width: 6.0, color: .red) { (response) in
            switch response{
            case .success(let data):
                XCTAssertEqual(data.status, "DONE", "test failed")
                expectations.fulfill()
            case .failure(let errorMessage):
                print(errorMessage)
            }
        }
        
        wait(for: [expectations], timeout: 5.0)
    }
    
    func testCreatePathFailureFlow() {
        
        let expectations = self.expectation(description: "Testing expectations")
        let routingServices = MockRoutingService(serviceCase: .error)
        routing = RoutingImp(mapView: GMSMapView(), routingService: routingServices)
        routing.createPath(routingInfoDTO: mockRouteInfo , width: 6.0, color: .red) { (response) in
            switch response{
            case .success(let data):
                print(data.status)
            case .failure(let errorMessage):
                XCTAssertEqual(errorMessage, somethingWentWrongErrorMessage, "test failed")
                expectations.fulfill()
            }
        }
        
        wait(for: [expectations], timeout: 5.0)
    }
    
    
    func testDistanceDataSuccessFlow(){
        let expectations = self.expectation(description: "Testing expectations")
        let routingServices = MockRoutingService(serviceCase: .success)
        routing = RoutingImp(mapView: GMSMapView(), routingService: routingServices)
        
        routing.getDistanceData(routingInfoDTO: mockRouteInfo) { (response) in
            switch response{
            case .success(let data):
                XCTAssertEqual(data.eta, 555, "test failed")
                XCTAssertEqual(data.distance, 234, "test failed")
                expectations.fulfill()
            case .failure(let errorMessage):
                print(errorMessage)
            }
            
        }
        wait(for: [expectations], timeout: 5.0)
        
    }
    
    func testDistanceDataFailureFlow(){
        let expectations = self.expectation(description: "Testing expectations")
        let routingServices = MockRoutingService(serviceCase: .error)
        routing = RoutingImp(mapView: GMSMapView(), routingService: routingServices)
        
        routing.getDistanceData(routingInfoDTO: mockRouteInfo) { (response) in
            switch response{
            case .success(let data):
                print(data.eta)
            case .failure(let errorMessage):
                XCTAssertEqual(errorMessage, somethingWentWrongErrorMessage, "test failed")
                expectations.fulfill()
            }
            
        }
        wait(for: [expectations], timeout: 5.0)
    }

}
