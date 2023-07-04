//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Fattah, Iram on 4/10/23.
//

import Foundation

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>

    func get(from url: URL, completion: @escaping (Result) -> Void)

}
