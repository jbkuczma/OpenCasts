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
        
        title = "Podcasts" // set the title of the top nav item in view
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(
            red: CGFloat(244/255.0),
            green: CGFloat(67/255.0),
            blue: CGFloat(54/255.0),
            alpha: CGFloat(1.0)
            )] // set color of nav title
        
        episodeCollectionView.collectionViewLayout = gridLayout
        episodeCollectionView.reloadData()
        
        
        
        self.tabBarController?.delegate = UIApplication.shared.delegate as? UITabBarControllerDelegate
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
    
    // create each cell
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
    
    // TODO: fetch podcasts that are saved
    func retrievePodcasts() -> [Any] {
        let podcasts: [Any] = []
        
        
        return podcasts
    }


}

