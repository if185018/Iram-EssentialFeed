//
//  LoadFeedFromCacheUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Fattah, Iram on 5/7/23.
//

import XCTest
import EssentialFeed

class LoadFeedFromCacheUseCaseTests: XCTestCase {

    func test_init_doesNotMessageStoreUponCreation() {
        let (_, store) = makeSUT()

        XCTAssertEqual(store.recievedMessages, [])
    }

    func test_load_requestsCacheRetrieval() {
        let (sut, store) = makeSUT()

        sut.load { _ in }

        XCTAssertEqual(store.recievedMessages, [.retrieve])
    }

    func test_load_fails_OnRetrievalError() {
        let (sut, store) = makeSUT()
        var retrievalError = anyNSError()
        var recievedError: Error?
        let exp = expectation(description: "Wait for load completion")
        sut.load { result in
            switch result {
            case let .failure(error):
                recievedError = error
            default:
                XCTFail("Expected failure got \(result) instead")
            }
            exp.fulfill()
        }
        store.completeRetrieval(with: retrievalError)
        wait(for: [exp], timeout: 1.0)
        XCTAssertEqual(recievedError as NSError?, retrievalError)

    }

//    func test_load_deliversNoImagesOnEmptyCache() {
//        let (sut, store) = makeSUT()
//        let exp = expectation(description: "Wait for load completion")
//
//        var recievedImages: [FeedImage]?
//        sut.load { result in
//
//            exp.fulfill()
//        }
//        store.completeRetrieval(with: retrievalError)
//        wait(for: [exp], timeout: 1.0)
//        XCTAssertEqual(recievedError as NSError?, retrievalError)
//
//    }


    // MARK: Helpers

    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #file, line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }

    private func anyNSError() -> NSError {
       return NSError(domain: "any Error", code: 0)
    }

}



