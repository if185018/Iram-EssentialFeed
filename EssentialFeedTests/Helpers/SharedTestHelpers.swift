//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Fattah, Iram on 5/12/23.
//

import Foundation

func anyNSError() -> NSError {
  return NSError(domain: "any Error", code: 0)
}

 func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyData() -> Data {
    return Data("any data".utf8)
}
