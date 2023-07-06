//
//  FeedStoreSpy.swift
//  EssentialFeedTests
//
//  Created by Fattah, Iram on 5/7/23.
//

import Foundation
import EssentialFeed

class FeedStoreSpy: FeedStore {
     enum RecievedMessage: Equatable {
         case deleteCacheFeed
         case insert([LocalFeedImage], Date)
         case retrieve 
     }

     private(set) var recievedMessages = [RecievedMessage]()

     private var deletionCompletions = [DeletionCompletion]()
     private var insertionCompletions = [InsertionCompletion]()
     private var retrievalCompletions = [RetrievalCompletion]()

     func deleteCachedFeed(completion: @escaping DeletionCompletion) {
         deletionCompletions.append(completion)
         recievedMessages.append(.deleteCacheFeed)
     }

     func completeDeletion(with error: Error, at index: Int = 0) {
         deletionCompletions[index](.failure(error))
     }

     func completeDeletionSuccessfully(at index: Int = 0) {
         deletionCompletions[index](.success(()))
     }

     func completeInsertion(with error: Error, at index: Int = 0) {
         insertionCompletions[index](.failure(error))
     }

     func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
         insertionCompletions.append(completion)
         recievedMessages.append(.insert(feed, timestamp))
     }

     func completeInsertionSuccessfully(at index: Int = 0) {
         insertionCompletions[index](.success(()))
     }

    func retrieve(completion: @escaping RetrievalCompletion) {
        retrievalCompletions.append(completion)
        recievedMessages.append(.retrieve)
    }

    func completeRetrieval(with error: Error, at index: Int = 0) {
        retrievalCompletions[index](.failure(error))
    }

    func completeRetrievalWithEmptyCache(at index: Int = 0) {
        retrievalCompletions[index](.success(.none))
    }

    func completeRetrieval(with feed: [LocalFeedImage], timestamp: Date, at index: Int = 0) {
        retrievalCompletions[index](.success((CachedFeed(feed: feed, timestamp: timestamp))))
    }


 }
