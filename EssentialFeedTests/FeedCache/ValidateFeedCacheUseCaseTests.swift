//
//  ValidateFeedCacheUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Fattah, Iram on 5/12/23.
//

import XCTest
import EssentialFeed

class ValidateFeedCacheUseCaseTests: XCTestCase {


    func test_init_doesNotMessageStoreUponCreation() {
        let (_, store) = makeSUT()

        XCTAssertEqual(store.recievedMessages, [])
    }

    func test_validateCache_deletesCacheOnRetrievalError() {
        let (sut, store) = makeSUT()
        sut.validateCache()

        store.completeRetrieval(with: anyNSError())
        XCTAssertEqual(store.recievedMessages, [.retrieve, .deleteCacheFeed])
    }

    func test_validateCache_doesNotDeleteCacheOnEmptyCache() {
        let (sut, store) = makeSUT()
        sut.validateCache()

        store.completeRetrievalWithEmptyCache()
        XCTAssertEqual(store.recievedMessages, [.retrieve])
    }


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
