//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Fattah, Iram on 4/1/23.
//

import XCTest

class RemoteFeedLoader {

}

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()


        XCTAssertNil(client.requestedURL)
    }

}
