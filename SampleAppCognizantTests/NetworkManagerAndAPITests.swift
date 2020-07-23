//
//  NetworkManagerAndAPITests.swift
//  SampleAppCognizantTests
//
//  Created by nous on 23/07/20.
//  Copyright © 2020 yogesh. All rights reserved.
//

import XCTest
@testable import SampleAppCognizant

// Testing with Live Server
class NetworkManagerAndAPITests: XCTestCase {
    
    let apiManager = ApiManager()
    let networkManager = NetworkManager()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetItemList() {
        let expectation = self.expectation(description: "Network Data Error")
        apiManager.getListData(completion: {(items, title) -> Void in
            XCTAssertNotNil(items)
            expectation.fulfill()
        }, onError: { err -> Void in
            XCTFail()
        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }

    func testNetworkGetCall() {
        let expectation = self.expectation(description: "Network Request Error")
        let urlString:String = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        networkManager.getDataCall(url: urlString, completion: {responseData -> Void in
            XCTAssertNotNil(responseData)
            expectation.fulfill()
        }, onError: { error -> Void in
            XCTFail()
        })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }

}
