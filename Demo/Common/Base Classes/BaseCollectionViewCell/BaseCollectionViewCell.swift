//
//  BaseCollectionViewCell.swift
//  ScheduleApp
//
//  Created on 30.10.2020.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {

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

    func initSetup() {
        
    }
   
    class var reuseIdentifier: String {
        String(describing: Self.self)
    }
    
    class var nibName: String {
        String(describing: Self.self)
    }
}

extension UICollectionView {
    func register(_ cellClass: BaseCollectionViewCell.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }
    
    func dequeueReusableCell<CellType: BaseCollectionViewCell>(for indexPath: IndexPath) -> CellType? {
        dequeueReusableCell(withReuseIdentifier: CellType.reuseIdentifier, for: indexPath) as? CellType
    }
}
