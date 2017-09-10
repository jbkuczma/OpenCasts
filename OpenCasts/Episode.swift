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
    
    var title: String!
    var date: String!
    var duration: String!
    var url: String!
    var description: String!
    
    init(title: String, date: String, duration: String, url: String, description: String) {
        self.title = title
        self.date = date
        self.duration = duration
        self.url = url
        self.description = description
    }
}
