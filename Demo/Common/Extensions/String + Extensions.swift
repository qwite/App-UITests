//
//  String + Extensions.swift
//  Demo
//
//  Created by Кирилл on 03.11.2021.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, tableName: "Localizable", bundle: .current, comment: self)
    }
}
