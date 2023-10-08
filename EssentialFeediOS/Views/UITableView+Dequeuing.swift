//
//  UITableView+Dequeuing.swift
//  EssentialFeediOS
//
//  Created by Fattah, Iram on 10/7/23.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
