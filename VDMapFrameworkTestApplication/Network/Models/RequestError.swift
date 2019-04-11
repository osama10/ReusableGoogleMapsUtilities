//
//  RequestError.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 09/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

public struct RequestError: DTO, Error {
    let statusCode: Int?
    let error: String?
    let message: String?
    
    var localizedDescription: String {
        return message ?? "Something unexpected"
    }
}
