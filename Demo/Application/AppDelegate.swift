//
//  AppDelegate.swift
//  Demo
//
//  Created by Кирилл on 03.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let module = MainModule()
        openViewController(module.viewController)
        return true
    }
    
    private func openViewController(_ vc: UIViewController) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = vc
        self.window = window
        window.makeKeyAndVisible()
    }
}

