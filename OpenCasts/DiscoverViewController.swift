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
    
    private var categoryTableLabel: UILabel!
    private var categoryTableView: UITableView!
    private var searchInput: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSearchInput()
        createCategoryTable()
        
        self.categoryTableView.allowsSelection = true
    }
    
    func createSearchInput() {
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        
        searchInput = UISearchBar(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: 50))
        searchInput.placeholder = "Search"
        self.view.addSubview(searchInput) // add search input to window
    }
    
    func createCategoryTable() {
        let tabBarHeight = self.tabBarController?.tabBar.bounds.height
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        /* Create label for table */
        categoryTableLabel = UILabel(frame: CGRect(x: 0, y: barHeight + 50, width: displayWidth, height: 50))
        categoryTableLabel.text = "Categories"
        categoryTableLabel.textColor = UIColor(
            red: CGFloat(244/255.0),
            green: CGFloat(67/255.0),
            blue: CGFloat(54/255.0),
            alpha: CGFloat(1.0)
        )
        categoryTableLabel.textAlignment = .center
        self.view.addSubview(categoryTableLabel)
        /**************************/
        /* Create table */
        // height: displayHeight (height of window) - barHeight (height of statusBar) - tabBarHeight(height of tab nav bar at bottom) - 100 (two rows were being cut off)
        categoryTableView = UITableView(frame: CGRect(x: 0, y: barHeight + 100, width: displayWidth, height: displayHeight - barHeight - tabBarHeight! - 100))
        categoryTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        self.view.addSubview(categoryTableView) // add table to window
        /**************************/
    }
    
    // handle clicking category
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(categories[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    // create cell for row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(categories[indexPath.row])"
        return cell
    }

}

