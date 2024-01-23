//
//  PeopleInfo.swift
//  MovieAPP
//
//  Created by Nazrin on 22.12.23.
//

import Foundation

// MARK: - PeopleInfo
struct PeopleInfo: Codable {
    let cast: [Cast]?
    let id: Int?
    let results: [Cast]?
}

// MARK: - Cast
struct Cast: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let character, creditID: String?
    let order: Int?
    
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
        case character
        case creditID = "credit_id"
        case order
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case es = "es"
    case fr = "fr"
    case it = "it"
}
