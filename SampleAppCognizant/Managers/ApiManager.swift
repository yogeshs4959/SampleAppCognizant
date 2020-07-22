//
//  ApiManager.swift
//  SampleAppCognizant
//
//  Created by nous on 22/07/20.
//  Copyright © 2020 yogesh. All rights reserved.
//

import Foundation

protocol RestApiManager {
    func getListData(completion: @escaping ([Item], String) -> (), onError: @escaping (Error?) -> ())
}

class ApiManager: RestApiManager {
    
    let networkManager = NetworkManager()
    
    init() {
    }
    
    //Method do get List of Items and navigation title
    func getListData(completion: @escaping ([Item], String) -> (), onError: @escaping (Error?) -> ()) {
        
        //Because of single api request Not dividing url into different part like endpoint
        let urlString:String = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        
        networkManager.getDataCall(url: urlString, completion: {responseData -> Void in
            do {
                let decoder = JSONDecoder()
                /* Using JsonDecoder here. Data coming from rest was not in utf8 format.
                After setting Accept type in header also response data was not in utf8. So converted here
                 */
                let utf8Data = String(decoding: responseData, as: UTF8.self).data(using: .utf8)
                let responseJson = try decoder.decode(List.self, from: utf8Data!)
                completion(responseJson.items ?? [],  responseJson.navigationTitle ?? "")
            } catch {
                onError(error)
            }
        }, onError: { error -> Void in
            onError(error)
        })
        
    }
    
}
