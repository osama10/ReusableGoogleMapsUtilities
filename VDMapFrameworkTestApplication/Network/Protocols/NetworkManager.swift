//
//  EndpointProvider.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 10/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

protocol NetworkManager {
    static var shared : NetworkManager { get }
    func request<E: EndpointProvider>(_ endpointProvider: E,
                                      completion: @escaping ((NetworkResult<E.Response, E.Failure, NetworkError>) -> Void))
}
