//
//  Constants.swift
//  YTunesApp
//
//  Created by Evgeniy Docenko on 07.04.2023.
//

import Foundation

enum FontNames: String {
    case openSansBold = "OpenSans-Bold"
    case openSansSemiBold = "OpenSans-SemiBold"
    case openSansRegular = "OpenSans-Regular"
}

enum Destination {
    case createAccount(id: String)
    case forgotPassword
}
