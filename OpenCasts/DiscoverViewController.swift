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
    private var categoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        categoryTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        categoryTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        self.view.addSubview(categoryTableView)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(categories[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(categories[indexPath.row])"
        return cell
    }

}

