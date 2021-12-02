//
//  MainModule.swift
//  Demo
//
//  Created by Кирилл on 03.11.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class MainModule {
    
    let viewController: MainViewController
    
    private let presenter: MainPresenter
    
    init() {

        guard let viewController = MainViewController.instance() else {
            fatalError("MainViewController doesn't exist")
        }

        let presenter = MainPresenter()
        viewController.output = presenter
        presenter.view = viewController
        
        self.viewController = viewController
        self.presenter = presenter
    }
}
