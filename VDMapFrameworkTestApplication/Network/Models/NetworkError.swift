//
//  NetworkError.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 09/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

public enum NetworkError:Error {
    
    case requestCreation( String )
    case decoding(String)
    case server(String)
    case unknown(String)
}

