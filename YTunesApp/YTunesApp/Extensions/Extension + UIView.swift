//
//  Extension + UIView.swift
//  YTunesApp
//
//  Created by Evgeniy Docenko on 07.04.2023.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(view: [UIView]) {
        view.forEach { view in
            addSubview(view)
        }
    }
}
