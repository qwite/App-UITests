//
//  UIVIewController + Extension.swift
//  Demo
//
//  Created by Кирилл on 03.11.2021.
//

import UIKit

extension UIViewController {
    class func instance() -> Self? {
        let name = String(describing: Self.self).dropLast(14) // remove ViewController postfix
        return UIStoryboard(name: String(name), bundle: Bundle.current).instantiateInitialViewController() as? Self
    }
}
