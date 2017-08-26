//
//  SecondViewController.swift
//  OpenCasts
//
//  Created by James Kuczmarski on 8/26/17.
//  Copyright © 2017 James Kuczmarski. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let categories: NSArray = ["All", "Arts", "Buisness", "Comedy", "Education", "Games & Hobbies", "Government", "Health", "Family", "Religious", "Science & Medicine", "Social", "Sports", "Technology", "TV & Film"]
    private var categoryTAbleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        categoryTAbleView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        categoryTAbleView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        categoryTAbleView.dataSource = self
        categoryTAbleView.delegate = self
        self.view.addSubview(categoryTAbleView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(categories[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(categories[indexPath.row])"
        return cell
    }

}

