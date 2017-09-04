//
//  PodcastShowViewController.swift
//  OpenCasts
//
//  Created by James Kuczmarski on 8/28/17.
//  Copyright © 2017 James Kuczmarski. All rights reserved.
//

import UIKit

class PodcastShowViewController: UIViewController, XMLParserDelegate {
    
    var show: Podcast!
    var episodes: [Episode] = []
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var podcastImage: UIImageView!
    @IBOutlet weak var podcastTitle: UILabel!
    @IBOutlet weak var podcastArtist: UILabel!
    
    var loader = LoadingIndicator()

    override func viewDidLoad() {
        var frame: CGRect = CGRect(x: 0, y: 0, width: 50, height: 50)
        self.loader = LoadingIndicator(frame: frame)
        self.loader.center = self.view.center
        self.view.addSubview(loader)
        self.headerView.isHidden = true
        self.loader.startAnimating()

        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("about to appear")
        ///////////////
        var image = UIImage()
        self.podcastImage.image = image.setImageWithURL(url: self.show.podcastImage)
        self.podcastTitle.text = self.show.podcastName
        self.podcastArtist.text = self.show.podcastArtist
        self.podcastImage.image!.getColors(completionHandler: {(colors) in
            self.headerView.backgroundColor = colors.background
            self.podcastTitle.textColor = colors.primary
            self.podcastArtist.textColor = colors.primary
            
            self.headerView.isHidden = false
        })
        
        let p = Parser()
        p.parseXML(url: URL(string: show.feedURL)!, completion: {(podcastData) in
            print("have data")
            self.loader.stopAnimating()
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
