//
//  CategoryPodcastsViewController.swift
//  OpenCasts
//
//  Created by James Kuczmarski on 8/27/17.
//  Copyright © 2017 James Kuczmarski. All rights reserved.
//

import UIKit

class CategoryPodcastsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var category: String!
    var count: Int!
    var episodes = [[String: Any]]() // array of dictionaries
    
    private var podcastInCategoryTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getData(completion: {()
            self.createCategoryTable()
            self.podcastInCategoryTableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createCategoryTable() {
        let tabBarHeight = self.tabBarController?.tabBar.bounds.height
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        /* Create table */
        podcastInCategoryTableView = UITableView(frame: CGRect(x: 0, y: barHeight + 50, width: displayWidth, height: displayHeight - barHeight - tabBarHeight!))
        podcastInCategoryTableView.register(UITableViewCell.self, forCellReuseIdentifier: "PodcastCell")
        podcastInCategoryTableView.dataSource = self
        podcastInCategoryTableView.delegate = self
        self.view.addSubview(podcastInCategoryTableView) // add table to window
        /**************************/
    }
    
    // handle clicking category
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("clicked")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.episodes.count
    }
    
    // create cell for row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PodcastCell", for: indexPath as IndexPath)
        let podcastTitle = self.episodes[indexPath.row]["collectionName"] as! String
        cell.textLabel!.text = podcastTitle
        return cell
    }
    
    // fetch data
    private func getData(completion: @escaping() -> ()) {
        let r = Request()
        r.search(query: category, completion: {(data) in
            self.count = data?["resultCount"] as! Int
            self.episodes = data?["results"] as! [[String: Any]]
            completion()
        })
    }
}
