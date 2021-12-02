//
//  MainCollectionCell.swift
//  Demo
//
//  Created by Кирилл on 03.11.2021.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

struct MainCollectionCellViewModel {
    let title: String
    let color: Color
    let file: URL

    enum Color: CaseIterable {
        case green, blue, orange, purple
        
        var firstColor: UIColor {
            switch self {
            case .green: return Resources.Colors.green1
            case .blue: return Resources.Colors.blue1
            case .orange: return Resources.Colors.orange1
            case .purple: return Resources.Colors.purple1
            }
        }
        
        var secondColor: UIColor {
            switch self {
            case .green: return Resources.Colors.green2
            case .blue: return Resources.Colors.blue2
            case .orange: return Resources.Colors.orange2
            case .purple: return Resources.Colors.purple2
            }
        }
    }
}

class MainCollectionCell: BaseCollectionViewCell {
    
    @IBOutlet private weak var gradientView: GradientView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var coverTitleLabel: UILabel!

    private let titleMaskView = UIView()
    private(set) var viewModel: MainCollectionCellViewModel?
    
    var progress: Double = 0 {
        didSet { updateMask() }
    }

    override func initSetup() {
        super.initSetup()
        
        titleLabel.font = Resources.Fonts.heading
        titleLabel.textColor = Resources.Colors.black
        titleLabel.textAlignment = .center
        
        coverTitleLabel.textAlignment = titleLabel.textAlignment
        coverTitleLabel.font = titleLabel.font
        coverTitleLabel.textColor = Resources.Colors.white
        coverTitleLabel.mask = titleMaskView
        
        titleMaskView.backgroundColor = .black
        
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 45
        
        gradientView.layer.masksToBounds = true
        gradientView.layer.cornerRadius = 25
    }
    
    private func updateMask() {
        titleMaskView.frame = coverTitleLabel.bounds
        titleMaskView.frame.size.width = coverTitleLabel.bounds.width * CGFloat(progress)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let rect = contentView.bounds.insetBy(dx: 10, dy: 10)
        contentView.layer.shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: contentView.layer.cornerRadius).cgPath
        updateMask()
    }
    
    func setup(with viewModel: MainCollectionCellViewModel?) {
        self.viewModel = viewModel
        titleLabel.text = viewModel?.title
        coverTitleLabel.text = viewModel?.title
        
        gradientView.firstColor = viewModel?.color.firstColor ?? Resources.Colors.white
        gradientView.secondColor = viewModel?.color.secondColor ?? Resources.Colors.white
    }
}
