//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Surendra Karibandi on 04/07/21.
//

import XCTest

class RemoteFeedLoader{
    
}

class HTTPClient {
    var requestedURL: URL?
    
}

class RemoteFeedLoaderTests: XCTestCase {
    func test_Init() {
        let _ = RemoteFeedLoader()
        let client = HTTPClient()
        
        XCTAssertNil(client.requestedURL)
    }
}
