//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Surendra Karibandi on 04/07/21.
//

import XCTest

class RemoteFeedLoader{
    func load()  {
        HTTPClient.sharedInstance.get(from: URL(string: "https://www.google.com")!)
    }
}

class HTTPClient {
    static var sharedInstance = HTTPClient()
    var requestedURL: URL?
    
    func get(from url: URL) {}
    
}

class HTTPClientSpy: HTTPClient {
    override func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_Init_doesNotRequestDataFromURL() {
        let _ = RemoteFeedLoader()
        let client = HTTPClientSpy()
        XCTAssertNil(client.requestedURL)
    }
    
    func test_init_requestDataFromURL(){
        let sut = RemoteFeedLoader()
        let client = HTTPClientSpy()
        sut.load()
        XCTAssertNotNil(client.requestedURL)
    }
}
