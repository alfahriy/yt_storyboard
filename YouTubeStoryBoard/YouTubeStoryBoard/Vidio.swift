//
//  Vidio.swift
//  YouTubeStoryBoard
//
//  Created by alfahri yudha muqorrobin on 15/03/21.
//

import Foundation

struct Video: Decodable { //menerjemahkan json ke dalam aplikasi
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAd"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init (from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self) //container adalah nama lain dari json object
            
            let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
            
            // Parse title
            self.title = try snippetContainer.decode(String.self, forKey: .title)
            
            self.description = try snippetContainer.decode(String.self, forKey: .description)
            
            // Parse the publish date
            self.published = try snippetContainer.decode(Date.self, forKey: .published)
            
            // Parse thumbnails
            let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
            
            let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
            
            self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
            
            // Parse Video ID
            let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
            
            self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        }
    }

