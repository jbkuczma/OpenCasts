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
    var episode: Episode = Episode(title: "", date: "", duration: 0.0, url: "", description: "")
    var episodeTitle: String = String()
    var episodeDescription = String()
    var episodeDate = String()
    var episodeURL = String()
    var episodeDuration = Float()
    var episodes: [Episode] = []
    
    var podcastData = [String: Any]()
    
    override init() {
        
    }
    
    func parseXML(url: URL, completion: @escaping(_ data: [String: Any]) -> ()) {
        req.getXML(url: url) { data, error in
            let parser = XMLParser(data: data!)
            parser.delegate = self
            parser.parse()
            completion(self.podcastData)
        }
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        self.el = elementName
        if elementName == "item" {
            self.episodeTitle = String()
            self.episodeDescription = String()
            self.episodeDuration = Float()
            self.episodeDate = String()
            self.episodeURL = String()
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            self.episode.title = episodeTitle
            self.episode.date = episodeDate
            self.episode.description = episodeDescription
            self.episode.url = episodeURL
            self.episode.duration = episodeDuration
            self.episodes.append(episode)
            
            self.podcastData["episodes"] = self.episodes
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
                self.episodeDuration = Float(String(data)!)!
            }
            if self.el == "media:content" {
                self.episodeURL += data
            }
            if self.el == "pubDate" {
                self.episodeDate += data
            }
        }
    }
}
