//
//  FeedViewModel.swift
//  EssentialFeediOS
//
//  Created by Fattah, Iram on 9/4/23.
//

import EssentialFeed
import Foundation

protocol FeedView {
    func display(feed: [FeedImage])
}

protocol FeedLoadingView: AnyObject {
    func display(isLoading: Bool)
}

final class FeedPresenter {
    typealias Observer<T> = (T) -> Void

    private let feedLoader: FeedLoader

    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }

    var feedView: FeedView?
    var loadingView: FeedLoadingView?

    func loadFeed() {
        loadingView?.display(isLoading: true)
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.feedView?.display(feed:feed)
            }
            self?.loadingView?.display(isLoading: false)
        }
    }
}
