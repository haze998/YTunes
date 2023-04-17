//
//  LogoView.swift
//  YTunesApp
//
//  Created by Evgeniy Docenko on 17.04.2023.
//

import Foundation
import UIKit
import SnapKit

class LogoView: UIView {
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "firebase")
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.openSansSemiBold.rawValue, size: 20)
        label.textColor = .black
        return label
    }()
    
    private lazy var subLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: FontNames.openSansRegular.rawValue, size: 16)
        label.textColor = .lightGray
        return label
    }()
    
    init(title: String, subTitle: String) {
        super.init(frame: .zero)
        
        self.titleLabel.text = title
        self.subLabel.text = subTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubviews(view: [logoImageView, titleLabel, subLabel])
        setupConstraints()
    }
    
    private func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.height.equalTo(150)
            make.width.equalTo(100)
            make.top.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView).inset(160)
            make.centerX.equalToSuperview()
        }
        
        subLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).inset(30)
            make.centerX.equalToSuperview()
        }
    }
}
