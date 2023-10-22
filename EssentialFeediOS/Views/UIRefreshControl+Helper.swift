//
//  UIRefreshControl+Helper.swift
//  EssentialFeediOS
//
//  Created by Fattah, Iram on 10/21/23.
//

import Foundation

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
