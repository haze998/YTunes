//
//  CustomButton.swift
//  YTunesApp
//
//  Created by Evgeniy Docenko on 17.04.2023.
//

import Foundation
import UIKit
import SnapKit

class CustomButton: UIButton {

    enum FonSizeButton {
        case big
        case medium
        case small
    }
    
    init(title: String, withBackgroundColor: Bool = false, fontSize: FonSizeButton) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        layer.cornerRadius = 15
        
        backgroundColor = withBackgroundColor ? .orange : .clear
        let titleColor: UIColor = withBackgroundColor ? .white : .lightGray
        setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case .big:
            titleLabel?.font = UIFont(name: FontNames.openSansBold.rawValue, size: 24)
        case .medium:
            titleLabel?.font = UIFont(name: FontNames.openSansSemiBold.rawValue, size: 16)
        case .small:
            titleLabel?.font = UIFont(name: FontNames.openSansSemiBold.rawValue, size: 14)
        }
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
