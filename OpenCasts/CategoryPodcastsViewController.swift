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
    var podcasts = [[String: Any]]() // array of dictionaries
    
    @IBOutlet weak var podcastInCategoryTableView: UITableView!

    override func viewDidLoad() {
        title = category
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(
            red: CGFloat(244/255.0),
            green: CGFloat(67/255.0),
            blue: CGFloat(54/255.0),
            alpha: CGFloat(1.0)
            )]
        
        podcastInCategoryTableView.delegate = self
        podcastInCategoryTableView.dataSource = self
        self.automaticallyAdjustsScrollViewInsets = false
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getData(completion: {()
            self.podcastInCategoryTableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // handle clicking category
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("clicked")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.podcasts.count
    }
    
    // create custom cell for row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let podcastRanking = indexPath.row + 1
        let podcastTitle = self.podcasts[indexPath.row]["collectionName"] as! String
        let podcastArtist = self.podcasts[indexPath.row]["artistName"] as! String
        let podcastImage = self.podcasts[indexPath.row]["artworkUrl100"] as! String
        let cell = tableView.dequeueReusableCell(withIdentifier: "PodcastCell", for: indexPath as IndexPath) as! CategoryPodcastCollectionViewCell
        
        cell.rankLabel.text = String(podcastRanking)
        cell.artistLabel.text = podcastArtist
        cell.titleLabel.text = podcastTitle
        
        let data = try? Data(contentsOf: URL(string: podcastImage)!)
        cell.podcastImage.image = UIImage(data: data!)
        
        return cell
    }
    
    // fetch data
    private func getData(completion: @escaping() -> ()) {
        let r = Request()
        r.search(query: category, completion: {(data) in
            self.count = data?["resultCount"] as! Int
            self.podcasts = data?["results"] as! [[String: Any]]
            completion()
        })
    }
}
