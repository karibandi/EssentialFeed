//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Surendra Karibandi on 04/07/21.
//

import XCTest

class RemoteFeedLoader{
    let client: HTTPClient
    let url: URL
    
    init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    func load()  {
        client.get(from: url)
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
        let url = URL(string: "www.goole.com")!
        
        let _ = RemoteFeedLoader(url: url, client: client)
        XCTAssertNil(client.requestedURL)
    }
    
    func test_init_requestDataFromURL(){
        let client = HTTPClientSpy()
        let url = URL(string: "www.google.com")!
        let sut = RemoteFeedLoader(url: url, client: client)
        sut.load()
        XCTAssertEqual(client.requestedURL, url)
    }
}
