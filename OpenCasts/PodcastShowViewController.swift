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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("about to appear")
        print(self.show.podcastArtist)
//        var frame: CGRect = CGRect(x: 0, y: 300, width: 100, height: 100)
//        let l = LoadingIndicator(frame: frame)
//        self.view.addSubview(l)
//        l.startAnimating()
        let p = Parser()
        p.parseXML(url: URL(string: show.feedURL)!, completion: {(podcastData) in
            print("have data")
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
