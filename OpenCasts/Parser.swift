//
//  Parser.swift
//  OpenCasts
//
//  Created by James Kuczmarski on 8/29/17.
//  Copyright © 2017 James Kuczmarski. All rights reserved.
//

import Foundation

class Parser: NSObject, XMLParserDelegate {
    
    let req = Request()
    var el: String = String() // for xml
    var episodeTitle: String = String()
    var episodeDescription = String()
    var episodeDate = String()
    var episodeURL = String()
    var episodeDuration = String()
    var episodes: [Episode] = []
    
    var podcastData = [String: Any]()
    
    override init() {
        
    }
    
    func parseXML(url: URL, completion: @escaping(_ data: [String: Any]) -> ()) {
        req.getXML(url: url) { data, error in
            let parser = XMLParser(data: data!)
            parser.delegate = self
            parser.parse()
            self.podcastData["episodes"] = self.episodes
            completion(self.podcastData)
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        self.el = elementName
        if elementName == "item" {
            self.episodeTitle = String()
            self.episodeDescription = String()
            self.episodeDuration = String()
            self.episodeDate = String()
            self.episodeURL = String()
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let episode = Episode(title: "", date: "", duration: "", url: "", description: "")
            episode.title = episodeTitle
            episode.date = episodeDate
            episode.description = episodeDescription
            episode.url = episodeURL
            episode.duration = episodeDuration
            self.episodes.append(episode)
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        
        if(!data.isEmpty) {
            if self.el == "title" {
                self.episodeTitle += data
            }
            if self.el == "description" {
                self.episodeDescription += data
            }
            if self.el == "itunes:duration" {
                self.episodeDuration += String(data)!
            }
            if self.el == "media:content" || self.el == "enclosure" {
                self.episodeURL += data
                print(self.episodeURL)
            }
            if self.el == "pubDate" {
                self.episodeDate += data
            }
        }
    }
}
