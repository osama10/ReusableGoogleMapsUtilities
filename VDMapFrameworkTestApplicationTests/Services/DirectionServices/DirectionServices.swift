//
//  DirectionServices.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 16/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import XCTest
@testable import VDMapFrameworkTestApplication

class DirectionServicesTests: XCTestCase {
    
    var directionServices  : DirectionServices!
    
    override func setUp() {}

    override func tearDown() { }

    func testGetDirectionSuccessWithOkStatusFlow() {
        let expaction = self.expectation(description: "Success flow expectation")
        let mockManager = MockNetworkManager(networkManagerType: .success, mockDataFileName: "DirectionMockData")
       
        directionServices = DirectionServicesImp(networkManager: mockManager)
       
        directionServices.getDirections(routeInfoDTO: mockRouteInfo) { (response) in
            switch response{
            case .success(let data):
               XCTAssertEqual(data.status, "OK", "Test failed")
                expaction.fulfill()
            case .failure(let errorMessage):
                print(errorMessage)
            }
        }
        self.wait(for: [expaction], timeout: 5.0)
    }
    
    func testGetDirectionSuccessWithoutOkStatusFlow() {
        let expaction = self.expectation(description: "Success flow expectation")
        let mockManager = MockNetworkManager(networkManagerType: .success, mockDataFileName: "ErrorMockData")
        
        directionServices = DirectionServicesImp(networkManager: mockManager)
        
        directionServices.getDirections(routeInfoDTO: mockRouteInfo) { (response) in
            switch response{
            case .success(_):
                print("success")
            case .failure(let errorMessage):
                XCTAssertEqual(errorMessage, somethingWentWrongErrorMessage, "Test failed")
                expaction.fulfill()
            }
        }
        self.wait(for: [expaction], timeout: 5.0)
    }

    func testGetDirectionsFailureFlow() {
        let expaction = self.expectation(description: "Success flow expectation")
        let mockManager = MockNetworkManager(networkManagerType: .failure, mockDataFileName: "DirectionMockData")
        
        directionServices = DirectionServicesImp(networkManager: mockManager)
        
        directionServices.getDirections(routeInfoDTO: mockRouteInfo) { (response) in
            switch response{
            case .success(let data):
               print(data.status ?? "Success")
            case .failure(let errorMessage):
                XCTAssertEqual(errorMessage, somethingWentWrongErrorMessage, "Test failed")
                expaction.fulfill()
            }
        }
        self.wait(for: [expaction], timeout: 5.0)
    }

    func testGetDirectionFailureFlow() {
        
        let expaction = self.expectation(description: "Success flow expectation")
        let mockManager = MockNetworkManager(networkManagerType: .error, mockDataFileName: "FailureMockData")
        
        directionServices = DirectionServicesImp(networkManager: mockManager)
        
        directionServices.getDirections(routeInfoDTO: mockRouteInfo) { (response) in
            switch response{
            case .success(let data):
                print(data.status ?? "Success")
            case .failure(let errorMessage):
                XCTAssertEqual(errorMessage, somethingWentWrongErrorMessage, "Test failed")
                expaction.fulfill()
            }
        }
        self.wait(for: [expaction], timeout: 5.0)
    }
}
