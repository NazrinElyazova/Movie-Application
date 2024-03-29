//
//  Movie.swift
//  MovieAPP
//
//  Created by Nazrin on 05.12.23.
//

import Foundation

// MARK: - Movie

struct Movie: Codable {
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?
}
enum CodingKeys: String, CodingKey {
    case page, results
    case totalPages = "total_pages"
    case totalResults = "total_results"
}


// MARK: - MovieResult
struct MovieResult: Codable, TopImageBottomLabelProtocol {
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    var titleText: String {
        title ?? ""
    }
    
    var imagePath: String {
        backdropPath ?? ""
    }
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        
    }
}
