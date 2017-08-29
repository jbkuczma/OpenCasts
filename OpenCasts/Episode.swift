//
//  Episode.swift
//  OpenCasts
//
//  Created by James Kuczmarski on 8/28/17.
//  Copyright © 2017 James Kuczmarski. All rights reserved.
//

import Foundation

/*
 * A Episode is a subclass of Podcast. It will include information such as its title of epsiode, duration, stream/download url, description
 *
 */
class Episode {
    
    let title: String!
    let date: String!
    let duration: Float!
    let url: String!
    let description: String!
    
    init(title: String, date: String, duration: Float, url: String, description: String) {
        self.title = title
        self.date = date
        self.duration = duration
        self.url = url
        self.description = description
    }
}
