//
//  DistanceResponse.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 14/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

struct DistanceResponse: Codable {
  
    let destinationAddresses, originAddresses: [String]?
    let rows: [Row]?
    let status: String?
    let errorMessage : String?

    enum CodingKeys: String, CodingKey {
        case destinationAddresses = "destination_addresses"
        case originAddresses = "origin_addresses"
        case rows, status
        case errorMessage = "error_message"

    }
}

struct Row: Codable {
    let elements: [Element]?
}

struct Element: Codable {
    let distance, duration: Distance?
    let status: String?
}

struct Distance: Codable {
    let text: String?
    let value: Int?
}
