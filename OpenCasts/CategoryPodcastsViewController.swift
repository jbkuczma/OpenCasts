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
    var count: Int!
    var episodes = [[String: Any]]() // array of dictionaries

    override func viewDidLoad() {
        super.viewDidLoad()
        print(category)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // fetch data
    private func getData() {
        let r = Request()
        r.search(query: category, completion: {(data) in
            self.count = data?["resultCount"] as! Int
            self.episodes = data?["results"] as! [[String: Any]]
            print(self.count)
        })
    }
}
