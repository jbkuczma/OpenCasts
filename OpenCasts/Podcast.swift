//
//  Podcast.swift
//  OpenCasts
//
//  Created by James Kuczmarski on 8/28/17.
//  Copyright © 2017 James Kuczmarski. All rights reserved.
//

import Foundation

/*
 * A Podcast is a show. It will include information such as its name, artist name, episodes, and genre
 *
 */
class Podcast {
    
    let podcastName: String!
    let podcastImage: String!
    let feedURL: String!
    
    init(podcastName: String, podcastImage: String, feedURL: String) {
        self.podcastName = podcastName
        self.podcastImage = podcastImage
        self.feedURL = feedURL
    }
}
