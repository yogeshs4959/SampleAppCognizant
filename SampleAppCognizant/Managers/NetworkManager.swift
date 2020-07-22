//
//  NetworkManager.swift
//  SampleAppCognizant
//
//  Created by nous on 22/07/20.
//  Copyright © 2020 yogesh. All rights reserved.
//

import Foundation

protocol URLSessionManager {
    func getDataCall(url:String, completion: @escaping (Data) -> (), onError: @escaping (Error) -> ())
}


class NetworkManager: URLSessionManager {
    
    //This method is common for all GET RestAPI call  
    func getDataCall(url: String, completion: @escaping (Data) -> (), onError: @escaping (Error) -> ()) {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            if error == nil && data != nil {
                completion(data!)
            } else {
                onError(error!)
            }
        })
        task.resume()
    }
    
}
