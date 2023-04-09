//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Fattah, Iram on 3/31/23.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
