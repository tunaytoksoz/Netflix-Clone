//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by Tunay Toksöz on 2.11.2022.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items : [videoElement]
}

struct videoElement : Codable {
    let id : idVideoElement
}

struct idVideoElement : Codable{
    let kind : String
    let videoId : String
}
