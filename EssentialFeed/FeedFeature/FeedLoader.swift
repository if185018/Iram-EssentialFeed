//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Fattah, Iram on 3/31/23.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping () -> Void)
}
