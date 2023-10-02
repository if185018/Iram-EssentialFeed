//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Fattah, Iram on 9/4/23.
//

import Foundation
import EssentialFeed

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool

    var hasLocation: Bool {
        return location != nil
    }
}
