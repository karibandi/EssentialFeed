//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Surendra Karibandi on 04/07/21.
//

import XCTest

class RemoteFeedLoader{
    func load()  {
        HTTPClient.sharedInstance.requestedURL = URL(string: "https://www.google.com")
    }
}

class HTTPClient {
    static let sharedInstance = HTTPClient()
    private init(){}
    var requestedURL: URL?
    
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_Init_doesNotRequestDataFromURL() {
        let _ = RemoteFeedLoader()
        let client = HTTPClient.sharedInstance
        XCTAssertNil(client.requestedURL)
    }
    
    func test_init_requestDataFromURL(){
        let sut = RemoteFeedLoader()
        let client = HTTPClient.sharedInstance
        sut.load()
        XCTAssertNotNil(client.requestedURL)
    }
}
