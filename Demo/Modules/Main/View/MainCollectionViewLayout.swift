//
//  CollectionViewLayout.swift
//  Demo
//
//  Created by Кирилл on 04.11.2021.
//

import UIKit

class MainCollectionViewLayout: UICollectionViewFlowLayout {

    init(pageSize: CGSize, lineSpacing: CGFloat) {
        super.init()
//        scrollDirection = .horizontal
        itemSize = pageSize
        minimumLineSpacing = lineSpacing
        minimumInteritemSpacing = lineSpacing
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                      withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return proposedContentOffset }
        let width = itemSize.width + minimumLineSpacing
        let rawPageValue = proposedContentOffset.x / width

        let endOffset = collectionView.contentSize.width
            - collectionView.frame.width
            + collectionView.contentInset.right
        let pageOffset = round(rawPageValue) * width - collectionView.contentInset.left
        let proposed = proposedContentOffset.x
        if endOffset - pageOffset < width, proposed - pageOffset > endOffset - proposed {
            return CGPoint(x: endOffset, y: proposedContentOffset.y)
        }
        return CGPoint(x: pageOffset, y: proposedContentOffset.y)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect) ?? []
        guard let collection = collectionView else { return attributes }

        for attr in attributes {
            let distanceFromCenters = abs(attr.frame.midX - collection.bounds.midX)
            let scaleCoef =  1 - (distanceFromCenters / collection.frame.width)
            let scale = max(0.8, min(scaleCoef, 1))
            attr.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool { true }
}
