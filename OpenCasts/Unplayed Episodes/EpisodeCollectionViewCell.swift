//
//  EpisodeCollectionViewCell.swift
//  OpenCasts
//
//  Created by James Kuczmarski on 8/26/17.
//  Copyright © 2017 James Kuczmarski. All rights reserved.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var episodeView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        episodeView.image = nil
    }
}
