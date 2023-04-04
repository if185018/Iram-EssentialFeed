//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Fattah, Iram on 4/1/23.
//

import XCTest
import EssentialFeed

private class HTTPClientSpy: HTTPClient {
    var requestedURLs = [URL]()
    var completions = [(Error) -> Void]()

    func get(from url: URL, completion: @escaping (Error) -> Void) {

        completions.append(completion)
        requestedURLs.append(url)
    }
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
       let (_, client) = makeSUT()

        XCTAssertTrue(client.requestedURLs.isEmpty)
    }

    func test_load_requestsDataFromURL() {
        let url = URL(string: "https://a-url.com")!
        let (sut, client) = makeSUT(url: url)

        sut.load()

        XCTAssertEqual(client.requestedURLs, [url])
    }

    func test_loadTwice_requestsDataFromURLTwice() {
        let url = URL(string: "https://a-url.com")!
        let (sut, client) = makeSUT(url: url)

        sut.load()
        sut.load()
        XCTAssertEqual(client.requestedURLs, [url, url])
    }

    func test_load_deliversErrorOnClientError() {
        let (sut, client) = makeSUT()
        var capturedErrors =  [RemoteFeedLoader.Error]()
        let clientError = NSError(domain: "Test", code: 0)
        sut.load {capturedErrors.append($0) }
        client.completions[0](clientError)
        XCTAssertEqual(capturedErrors, [.connectivity])
    }

    // MARK: Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut:RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut: sut, client: client)

    }


}
