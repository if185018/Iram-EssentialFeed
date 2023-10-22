//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Fattah, Iram on 10/21/23.
//

import Foundation

struct FeedErrorViewModel {
    let message: String?

    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }

    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
