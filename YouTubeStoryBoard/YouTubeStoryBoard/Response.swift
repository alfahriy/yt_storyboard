//
//  Response.swift
//  YouTubeStoryBoard
//
//  Created by alfahri yudha muqorrobin on 18/03/21.
//

import Foundation

struct Response: Decodable {
    var items: [Video]? // menjaga dari kekosongan nilai
    
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
    init (from decoder: Decoder) throws {
        let container = try
            decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try
            container.decode([Video].self, forKey: .items)
    }
}
