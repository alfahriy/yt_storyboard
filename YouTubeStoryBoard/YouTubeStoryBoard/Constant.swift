//
//  Constant.swift
//  YouTubeStoryBoard
//
//  Created by alfahri yudha muqorrobin on 15/03/21.
//

import Foundation

struct Constant {
    static var API_KEY = "AIzaSyDHzDsi3Bc9eiUOvetE2GwlNkDXRJTY4HM"
    static var PLAYLIST_ID = "UUKd4PNlXy-DcCEQr8NEsxqg"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constant.PLAYLIST_ID)&key=\(Constant.API_KEY)"
}
