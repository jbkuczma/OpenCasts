//
//  FirstViewController.swift
//  OpenCasts
//
//  Created by James Kuczmarski on 8/26/17.
//  Copyright © 2017 James Kuczmarski. All rights reserved.
//

import UIKit

class UnplayedEpisodesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var episodeCollectionView: UICollectionView!
    
    var gridLayout: GridLayout = GridLayout(numberOfColumns: 3)
    
    var images: [UIImage] = [UIImage(named: "IMG_1.png")!,
                             UIImage(named: "IMG_1.png")!,
                             UIImage(named: "IMG_1.png")!,
                             UIImage(named: "IMG_1.png")!,
                             UIImage(named: "IMG_1.png")!,
                             UIImage(named: "IMG_1.png")!,
                             UIImage(named: "IMG_1.png")!,
                             UIImage(named: "IMG_1.png")!,
                             UIImage(named: "IMG_1.png")!,
                             ]

    
    ///////
    // MARK: view methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Podcasts"
        
        episodeCollectionView.collectionViewLayout = gridLayout
        episodeCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK collectionView methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "episodeCell", for: indexPath) as! EpisodeCollectionViewCell
        
        let image = images[indexPath.item]
        cell.episodeView.image = image

        return cell
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        gridLayout.invalidateLayout()
    }


}

