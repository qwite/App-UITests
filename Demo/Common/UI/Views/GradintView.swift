//
//  GradintView.swift
//  Demo
//
//  Created by Кирилл on 03.11.2021.
//

import UIKit

class GradientView: BaseView {

    private var _firstColor = UIColor.white.cgColor
    @IBInspectable
    var firstColor: UIColor = .white {
        didSet {
            _firstColor = firstColor.cgColor
            setNeedsDisplay()
        }
    }
    
    private var _secondColor = UIColor.black.cgColor
    @IBInspectable
    var secondColor: UIColor = .black {
        didSet {
            _secondColor = secondColor.cgColor
            setNeedsDisplay()

        }
    }

    var firstPoint: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            setNeedsDisplay()
        }
    }

    var secondPoint: CGPoint = CGPoint(x: 1, y: 1) {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        let colors = [_firstColor, _secondColor] as CFArray
        let start = CGPoint(x: rect.origin.x + (rect.width - rect.origin.x) * firstPoint.x,
                            y: rect.origin.y + (rect.height - rect.origin.y) * firstPoint.y)
        let end = CGPoint(x: rect.origin.x + (rect.width - rect.origin.x) * secondPoint.x,
                          y: rect.origin.y + (rect.height - rect.origin.y) * secondPoint.y)
        guard let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil),
            let context = UIGraphicsGetCurrentContext() else { return }
        context.drawLinearGradient(gradient, start: start, end: end,
                                   options: [.drawsBeforeStartLocation, .drawsAfterEndLocation])
    }
}
