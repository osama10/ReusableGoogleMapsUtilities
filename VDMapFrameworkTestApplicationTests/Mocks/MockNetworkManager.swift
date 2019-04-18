//
//  MockNetworkManager.swift
//  VDMapFrameworkTestApplicationTests
//
//  Created by Osama Bin Bashir on 17/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation
@testable import VDMapFrameworkTestApplication

enum NetworkManagerType {
    case success, failure , error
}

class MockNetworkManager : NetworkManager{
   
    static var shared: NetworkManager = MockNetworkManager(networkManagerType: .success, mockDataFileName : "MockDirectionData")
    private let networkManagerType : NetworkManagerType
    private let mockDataFileName : String
    
    init(networkManagerType : NetworkManagerType, mockDataFileName : String) {
        self.networkManagerType = networkManagerType
        self.mockDataFileName = mockDataFileName
    }
    
    func request<E>(_ endpointProvider: E, completion: @escaping ((NetworkResult<E.Response, E.Failure, NetworkError>) -> Void)) where E : EndpointProvider {
        let result: NetworkResult<E.Response, E.Failure, NetworkError>

        switch networkManagerType {
        case .success:
            print("success")
            let data = self.getJSONResponse(from: self.mockDataFileName, fileType: "json")
            let decoder = JSONDecoder()
            let dto = try? decoder.decode(E.Response.self, from: data)
            result = .success(dto!)
            completion(result)
        case .failure:
            result = .error(.unknown("Something unexpected happens"))
            completion(result)
            
        case .error:
           let data = self.getJSONResponse(from: self.mockDataFileName, fileType: "json")
           let decoder = JSONDecoder()
           let errorDTO =  try? decoder.decode(E.Failure.self, from: data)
            if let errorDTO = errorDTO {
                result = .failure(errorDTO)
            }else{
                result = .error(.unknown("Something unexpected happens"))

           }
           completion(result)
        }
    }
    
    private func getJSONResponse(from fileName : String, fileType : String)->Data{
       
        guard let pathString = Bundle(for: type(of: self) ).path(forResource: fileName, ofType: fileType) else {
            fatalError("MockData.json not found")
        }
        guard let jsonString = try? NSString(contentsOfFile: pathString, encoding: String.Encoding.utf8.rawValue) else {
            fatalError("Unable to convert UnitTestData.json to String")
        }
        guard let jsonData = jsonString.data(using: String.Encoding.utf8.rawValue) else {
            fatalError("Unable to convert UnitTestData.json to NSData")
        }
       
        return jsonData
    }
    
}
