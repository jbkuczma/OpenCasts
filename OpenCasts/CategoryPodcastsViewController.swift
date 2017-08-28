//
//  CategoryPodcastsViewController.swift
//  OpenCasts
//
//  Created by James Kuczmarski on 8/27/17.
//  Copyright © 2017 James Kuczmarski. All rights reserved.
//

import UIKit

class CategoryPodcastsViewController: UIViewController {
    
    var category: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        print(category)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
