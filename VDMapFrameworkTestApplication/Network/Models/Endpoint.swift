//
//  Endpoint.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 09/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

public typealias QueryParams = [String: String]
public typealias Headers = [String: String]

public enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
}

 struct Endpoint <Body : DTO>{
    private let method: HTTPMethod
    private let path: [String]
    private let query: QueryParams?
    private let timeout: TimeInterval?
    private let body: Data?
    private let headers : Headers?
    let name: String?
    var api: API
    
    public init(api: API,
                method: HTTPMethod = .get,
                path: [String] = [],
                query: QueryParams? = nil,
                timeout: TimeInterval? = nil,
                body: Data? = nil,
                name: String? = nil,headers : Headers? = nil) {
        
        self.api = api
        self.method = method
        self.path = path
        self.query = query
        self.timeout = timeout
        self.body = body
        self.name = name
        self.headers = headers
    }
    
    private var url: URL {
        var components = URLComponents()
        components.scheme = api.baseURL.scheme
        components.host = api.baseURL.host
        components.port = api.baseURL.port
        components.path = "/" + (api.path + self.path).joined(separator: "/")
        components.queryItems = query?.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }
    
    func urlRequest() throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        
        if let headers = self.headers{
            try request.setHeaders(headers)

        }
        
        if let body = body {
            request.httpBody = body
        }
        
        if let timeout = timeout {
            request.timeoutInterval = timeout
        }
        
        return request
    }
    
}
