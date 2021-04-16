//
//  Model.swift
//  YouTubeStoryBoard
//
//  Created by alfahri yudha muqorrobin on 15/03/21.
//

import Foundation

class Model {
    func getvideos() {
        let url = URL(string: Constant.API_URL)
        
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) {(data,response,error) in
            if error != nil || data == nil {
                return
            }
            
            do {
                //ambil data ke video object
                let decoder = JSONDecoder() //memproses hasil decodable
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response)
            }
            catch {
                
            }
        }
        
        dataTask.resume()
    }
}
