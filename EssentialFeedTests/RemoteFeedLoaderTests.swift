//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Surendra Karibandi on 04/07/21.
//

import XCTest

class RemoteFeedLoader{
    let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func load()  {
        client.get(from: URL(string: "https://www.google.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
    
}

class HTTPClientSpy: HTTPClient {
    func get(from url: URL) {
        requestedURL = url
    }
    var requestedURL: URL?
    
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_Init_doesNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        let _ = RemoteFeedLoader(client: client)
        XCTAssertNil(client.requestedURL)
    }
    
    func test_init_requestDataFromURL(){
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(client: client)
        sut.load()
        XCTAssertNotNil(client.requestedURL)
    }
}
