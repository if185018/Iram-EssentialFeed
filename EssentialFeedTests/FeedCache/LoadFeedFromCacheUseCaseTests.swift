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


    // MARK: Helpers

    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #file, line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }


    private class FeedStoreSpy: FeedStore {
         enum RecievedMessage: Equatable {
             case deleteCacheFeed
             case insert([LocalFeedImage], Date)
         }

         private(set) var recievedMessages = [RecievedMessage]()

         private var deletionCompletions = [DeletionCompletion]()
         private var insertionCompletions = [InsertionCompletion]()

         func deleteCachedFeed(completion: @escaping DeletionCompletion) {
             deletionCompletions.append(completion)
             recievedMessages.append(.deleteCacheFeed)
         }

         func completeDeletion(with error: Error, at index: Int = 0) {
             deletionCompletions[index](error)
         }

         func completeDeletionSuccessfully(at index: Int = 0) {
             deletionCompletions[index](nil)
         }

         func completeInsertion(with error: Error, at index: Int = 0) {
             insertionCompletions[index](error)
         }

         func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
             insertionCompletions.append(completion)
             recievedMessages.append(.insert(feed, timestamp))
         }

         func completeInsertionSuccessfully(at index: Int = 0) {
             insertionCompletions[index](nil)
         }
     }
}



