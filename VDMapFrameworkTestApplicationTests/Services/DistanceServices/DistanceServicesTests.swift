//
//  DistanceServicesTests.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 16/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import XCTest
@testable import VDMapFrameworkTestApplication
class DistanceServicesTests: XCTestCase {

    var distanceServices  : DistanceServices!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetDistanceSuccessWithOkStatusFlow() {
        let expaction = self.expectation(description: "Success flow expectation")
        let mockManager = MockNetworkManager(networkManagerType: .success, mockDataFileName: "DistanceMockData")
        
        distanceServices = DistanceServicesImp(networkManager: mockManager)
        
        distanceServices.getTimeAndDistance(routeInfoDTO: mockRouteInfo) { (response) in
            switch response{
            case .success(let data):
                XCTAssertEqual(data.distance, 6725, "Test failed")
                expaction.fulfill()
            case .failure(let errorMessage):
                print(errorMessage)
            }
        }
        self.wait(for: [expaction], timeout: 5.0)
    }
    
    func testGetDistanceSuccessWithoutOkStatusFlow() {
        let expaction = self.expectation(description: "Success flow expectation")
        let mockManager = MockNetworkManager(networkManagerType: .success, mockDataFileName: "ErrorMockData")
        
        distanceServices = DistanceServicesImp(networkManager: mockManager)
        
        distanceServices.getTimeAndDistance(routeInfoDTO: mockRouteInfo) { (response) in
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
    
    func testGetDistanceErrorFlow() {
        let expaction = self.expectation(description: "Success flow expectation")
        let mockManager = MockNetworkManager(networkManagerType: .failure, mockDataFileName: "DistanceMockData")
        
        distanceServices = DistanceServicesImp(networkManager: mockManager)

        distanceServices.getTimeAndDistance(routeInfoDTO: mockRouteInfo) { (response) in
            switch response{
            case .success(let data):
                print(data.distance)
            case .failure(let errorMessage):
                XCTAssertEqual(errorMessage, somethingWentWrongErrorMessage, "Test failed")
                expaction.fulfill()
            }
        }
        self.wait(for: [expaction], timeout: 5.0)
    }
    
    func testGetDistanceFailureFlow() {
       
        let expaction = self.expectation(description: "Success flow expectation")
        let mockManager = MockNetworkManager(networkManagerType: .error, mockDataFileName: "FailureMockData")
        
        distanceServices = DistanceServicesImp(networkManager: mockManager)
        
        distanceServices.getTimeAndDistance(routeInfoDTO: mockRouteInfo) { (response) in
            switch response{
            case .success(let data):
                print(data.distance)
            case .failure(let errorMessage):
                XCTAssertEqual(errorMessage, somethingWentWrongErrorMessage, "Test failed")
                expaction.fulfill()
            }
        }
        self.wait(for: [expaction], timeout: 5.0)
    }
}
