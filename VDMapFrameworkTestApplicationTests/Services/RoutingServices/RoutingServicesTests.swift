//
//  RoutingServicesTests.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 17/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import XCTest
@testable import VDMapFrameworkTestApplication

class RoutingServicesTests: XCTestCase {

    var routingServices : RoutingService!
    let mockDirectionService = MockDirectionService()
    let mockDistanceService = MockDistanceService()

    override func setUp() {
        routingServices = RoutingServiceImp(networkManager: MockNetworkManager.shared, directionServices: mockDirectionService, distanceServices: mockDistanceService)
    }

    override func tearDown() {

    }

    func testGetDirections() {
        let expactations = self.expectation(description: "Get directions")
        routingServices.getDirections(routeInfoDTO: mockRouteInfo) { (response) in
            switch response{
            case .success(let data):
                XCTAssertEqual(data.status, "DONE", "test failed")
                expactations.fulfill()
            case .failure(let errorMessage):
                print("Failure")
            }
        }
        wait(for: [expactations], timeout: 5.0)
    }

    func testGetTimeAndDistance() {
        let expactations = self.expectation(description: "Get directions")
        routingServices.getTimeAndDistance(routeInfoDTO: mockRouteInfo) { (response) in
            switch response{
            case .success(let data):
                XCTAssertEqual(data.eta, 555, "test failed")
                XCTAssertEqual(data.distance, 234, "test failed")

                expactations.fulfill()
            case .failure(let errorMessage):
                print("Failure")
            }
        }
        wait(for: [expactations], timeout: 5.0)
    }


}
