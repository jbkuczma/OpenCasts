//
//  GridLayout.swift
//  OpenCasts
//
//  Created by James Kuczmarski on 8/26/17.
//  Copyright © 2017 James Kuczmarski. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewFlowLayout {

    private var numberOfColumns: Int = 3
    
    init(numberOfColumns: Int) {
        super.init()
        minimumLineSpacing = 1
        minimumInteritemSpacing = 1
        
        self.numberOfColumns = numberOfColumns
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: has not been implemented")
    }
    
    override var itemSize: CGSize {
        get {
            if let collectionView = collectionView {
                let itemWidth: CGFloat = (collectionView.frame.width/CGFloat(self.numberOfColumns)) - self.minimumInteritemSpacing
                let itemHeight: CGFloat = (collectionView.frame.width/CGFloat(self.numberOfColumns)) - self.minimumInteritemSpacing
                
                return CGSize(width: itemWidth, height: itemHeight)
            }
            
            // default fallback
            return CGSize(width: 100, height: 100)
        }
        
        set {
            super.itemSize = newValue
        }
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        if let collectionView = collectionView {
            return collectionView.contentOffset
        }
        
        return CGPoint.zero
    }
}
