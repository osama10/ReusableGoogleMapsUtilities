//
//  Result.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 09/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

public enum NetworkResult<V, W, E: Error> {
    case success(V)
    case failure(W)
    case error(NetworkError)
}
