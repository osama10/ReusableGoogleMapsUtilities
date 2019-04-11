//
//  URLRequest+Networking.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 09/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

extension URLRequest {
    
    mutating func setHeaders(_ headers: [String: String?]) throws {
        
        let failedHeaders: [String] = headers.flatMap {
            if let value = $0.value {
                setValue(value, forHTTPHeaderField: $0.key)
                return nil
            } else {
                return $0.key
            }
        }
        
        if !failedHeaders.isEmpty {
            throw NSError(domain: "networking",
                          code: 101,
                          userInfo: [ NSLocalizedDescriptionKey: "headers missing: \(failedHeaders)"]
            )
        }
    }
}
