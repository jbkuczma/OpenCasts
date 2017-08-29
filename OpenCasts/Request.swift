//
//  Request.swift
//  OpenCasts
//
//  Created by James Kuczmarski on 8/28/17.
//  Copyright © 2017 James Kuczmarski. All rights reserved.
//

import Foundation

class Request {
    
    private let baseURL: String = "https://itunes.apple.com/search"
    
    init() {
        
    }
    
    func createSearchURL(query: String) -> URL {
        let queryItems = [
            NSURLQueryItem(name: "entity", value: "podcast"),
            NSURLQueryItem(name: "term", value: query),
            NSURLQueryItem(name: "limit", value: "100")
        ]
        let urlComps = NSURLComponents(string: baseURL)!
        urlComps.queryItems = queryItems as [URLQueryItem]
        let searchURL = urlComps.url!
        return searchURL
    }
    
    func search(query: String) {
        let url: URL = self.createSearchURL(query: query)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            print(json)
        }
        task.resume()
    }
}
