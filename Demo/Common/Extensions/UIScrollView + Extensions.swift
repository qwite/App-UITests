//
//  UIScrollView + Extensions.swift
//  Demo
//
//  Created by Кирилл on 04.11.2021.
//

import UIKit

extension UIScrollView {
    var numberOfPages: Int {
        max(Int(self.contentSize.width / self.bounds.width), 0) + 1
    }
    
    var page: Int {
        get {
            let xOffset = contentOffset.x - adjustedContentInset.left
            let bounds = self.bounds.inset(by: adjustedContentInset)
            let page = Int((xOffset / bounds.width).rounded())
            return max(0,min(page, numberOfPages))
        }
        set {
            contentOffset.x = bounds.width * CGFloat(newValue)
        }
    }
}
