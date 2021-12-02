//
//  BaseView.swift
//  ScheduleApp
//
//  Created on 30.10.2020.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        initSetup()
    }

    func initSetup() { }
}
