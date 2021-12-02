//
//  Bundle + Extensions.swift
//  Demo
//
//  Created by Кирилл on 03.11.2021.
//

import UIKit

extension Bundle {
    static let current = Bundle(for: AppDelegate.self)

    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
