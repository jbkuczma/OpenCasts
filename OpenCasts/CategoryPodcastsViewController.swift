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
    
    var cache: NSCache<NSString, AnyObject>! = nil
    
    var loader = LoadingIndicator()
    
    @IBOutlet weak var podcastInCategoryTableView: UITableView!

    override func viewDidLoad() {
        
        var frame: CGRect = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.loader = LoadingIndicator(frame: frame)
        self.loader.center = self.view.center
        self.view.addSubview(loader)
        self.loader.startAnimating()
        podcastInCategoryTableView.isHidden = true
        
        title = category
        let nav = self.navigationController?.navigationBar
        let openCastRed = UIColor(
            red: CGFloat(244/255.0),
            green: CGFloat(67/255.0),
            blue: CGFloat(54/255.0),
            alpha: CGFloat(1.0)
        )
        nav?.titleTextAttributes = [NSForegroundColorAttributeName: openCastRed]
        nav?.tintColor = openCastRed
        
        podcastInCategoryTableView.delegate = self
        podcastInCategoryTableView.dataSource = self
        self.automaticallyAdjustsScrollViewInsets = false
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getData(completion: {()
            DispatchQueue.main.async {
                self.cache.setObject(self.podcasts as AnyObject, forKey: self.category as NSString)
                self.podcastInCategoryTableView.reloadData()
                self.loader.stopAnimating()
                self.podcastInCategoryTableView.isHidden = false
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // handle clicking category
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "podcastShow", sender: self)
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
        let podcastReleaseDate = self.podcasts[indexPath.row]["releaseDate"] as! String
        let cell = tableView.dequeueReusableCell(withIdentifier: "PodcastCell", for: indexPath as IndexPath) as! CategoryPodcastCollectionViewCell
        
        cell.rankLabel.text = String(podcastRanking)
        cell.releaseDataeLabel.text = self.cleanDate(date: podcastReleaseDate)
        cell.artistLabel.text = podcastArtist
        cell.titleLabel.text = podcastTitle
        
        let data = try? Data(contentsOf: URL(string: podcastImage)!)
        cell.podcastImage.image = UIImage(data: data!)
        
        return cell
    }
    
    // fetch data
    private func getData(completion: @escaping() -> ()) {
        let r = Request()
        if let cachedVersion = self.cache.object(forKey: category as NSString) {
            print("have cached version")
            self.podcasts = cachedVersion as! [[String: Any]]
            completion()
        } else {
            r.search(query: category, completion: {(data) in
                self.count = data?["resultCount"] as! Int
                self.podcasts = data?["results"] as! [[String: Any]]
                completion()
            })
        }
        
    }
    
    private func cleanDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: date)!
        dateFormatter.dateFormat = "M-dd-yyyy"
        dateFormatter.locale = tempLocale
        return dateFormatter.string(from: date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "podcastShow" {
            let vc = segue.destination as! PodcastShowViewController
            if let indexPath = self.podcastInCategoryTableView.indexPathForSelectedRow {
                let podcastTitle = self.podcasts[indexPath.row]["collectionName"] as! String
                let podcastArtist = self.podcasts[indexPath.row]["artistName"] as! String
                let podcastImage = self.podcasts[indexPath.row]["artworkUrl600"] as! String
                let feedURL = self.podcasts[indexPath.row]["feedUrl"] as! String
                
                let pod = Podcast(podcastName: podcastTitle, podcastArtist: podcastArtist, podcastImage: podcastImage, feedURL: feedURL)
                vc.show = pod
            }
        }
    }
}
