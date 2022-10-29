//
//  Tv.swift
//  Netflix Clone
//
//  Created by Tunay Toksöz on 29.10.2022.
//

import Foundation

// MARK: - TrendingMoviesResponse
struct TrendingTvsResponse: Codable {
    let page: Int
    let results: [Tv]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Tv: Codable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let name: String
    let originalLanguage: OriginalLanguage
    let originalName, overview, posterPath: String
    let mediaType: MediaType
    let genreIDS: [Int]
    let popularity: Double
    let firstAirDate: String
    let voteAverage: Double
    let voteCount: Int
    let originCountry: [String]

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, name
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case ja = "ja"
}
