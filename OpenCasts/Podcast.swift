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
    let podcastArtist: String!
    let episodes: [Episode]!
    let genre: String!
    
    init(podcastName: String, podcastArtist: String, episodes: [Episode], genre: String) {
        self.name = podcastName
        self.artist = podcastArtist
        self.episodes = episodes
        self.genre = genre
    }
}
