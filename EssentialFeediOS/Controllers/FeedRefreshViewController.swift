//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Fattah, Iram on 8/31/23.
//

import UIKit
import EssentialFeed

protocol FeedRefreshViewControllerDelegate {
    func didRequestFeedRefresh()
}

public final class FeedRefreshViewController: NSObject, FeedLoadingView {
    @IBOutlet private var view:  UIRefreshControl?

    var delegate: FeedRefreshViewControllerDelegate?

   @IBAction func refresh() {
        delegate?.didRequestFeedRefresh()
    }

    public func display(_ viewModel: FeedLoadingViewModel) {
        if viewModel.isLoading {
            view?.beginRefreshing()
        } else {
            view?.endRefreshing()
        }
    }

}
