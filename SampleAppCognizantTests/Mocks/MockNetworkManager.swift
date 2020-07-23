//
//  MockNetworkManager.swift
//  SampleAppCognizantTests
//
//  Created by nous on 23/07/20.
//  Copyright © 2020 yogesh. All rights reserved.
//

import Foundation
@testable import SampleAppCognizant

class MockNetworkManager: URLSessionManager {
    
    
    func getDataCall(url: String, completion: @escaping (Data) -> (), onError: @escaping (Error) -> ()) {
        let jsonString = "{\"title\":\"About Canada\",\"rows\":[{\"title\":\"Beavers\",\"description\":\"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony\", \"imageHref\":\"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg\"}]}"
        let data = jsonString.data(using: String.Encoding.utf8)
        if data != nil {
            completion(data!)
        }
    }
    
}



