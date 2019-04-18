//
//  URLSessionManager.swift
//  VDMapFrameworkTestApplication
//
//  Created by Osama Bin Bashir on 10/04/2019.
//  Copyright © 2019 Osama. All rights reserved.
//

import Foundation

public class URLSessionManager : NetworkManager {
    static var shared: NetworkManager = URLSessionManager(sessionStore: SessionManagerStore())
    
    
    //public static let shared: URLSessionManager = .init()
    private let sessionStore: SessionManagerStore
    
    init(sessionStore: SessionManagerStore) {
        self.sessionStore = sessionStore
    }

    
    func request<E>(_ endpointProvider: E, completion: @escaping ((NetworkResult<E.Response, E.Failure, NetworkError>) -> Void)) where E : EndpointProvider {
        
        let endpoint = endpointProvider.endpoint
        let manager = sessionStore.sessionManager(for: endpoint.api.baseURL)
        
        guard let urlRequest = try? endpointProvider.endpoint.urlRequest()else {
            return
        }

        if let requestData = urlRequest.httpBody {
           print(requestData)
        }
       
        print(urlRequest.url )
        
        let task = manager.dataTask(with: urlRequest) { [weak self](data, response, error) in
            
            let result: NetworkResult<E.Response, E.Failure, NetworkError>
            
            if let response = response as? HTTPURLResponse,
                !(200...299).contains(response.statusCode),
                error == nil {
                
                let decoder = JSONDecoder()
                let errorDTO = data != nil ? try? decoder.decode(E.Failure.self, from: data!) : nil
                
                if let errorDTO = errorDTO {
                    result = .failure(errorDTO)
                } else if let error = error {
                    result = .error(.server(error.localizedDescription))
                } else {
                    result = .error(.unknown("Something unexpected happens"))
                }
                
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let dto = try decoder.decode(E.Response.self, from: data)
                    result = .success(dto)
                    
                } catch let exception {
                    result = .error(.decoding(exception.localizedDescription))
                }
            } else {
                result = .error(.unknown("Something unexpected happens"))
            }
            
            DispatchQueue.main.async {
                completion(result)
            }
        }
        
        task.resume()
    }
    
   
}
