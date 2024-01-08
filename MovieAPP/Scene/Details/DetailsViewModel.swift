//
//  DetailsViewModel.swift
//  MovieAPP
//
//  Created by Nazrin on 11.12.23.
//

import Foundation



class DetailsViewModel {
    private let manager = DetailsManager()
    var movieItems = [MovieDetailModel]()
    var movieId: Int
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getDetail() {
        manager.getDetailsList(endpoint: .detailsMovie, movieID: movieId ) { data, errorMessage in
            if let errorMessage = errorMessage {
                self.error?(errorMessage)
            } else if let data {
//               let movie = data.results?[0]
                self.movieItems.append(.init(type: .poster(data.backdropPath ?? "" )))
                self.movieItems.append(.init(type: .title(data.originalTitle ?? "" )))
                self.movieItems.append(.init(type: .info(MovieInfoModel(rating: "\(data.voteAverage ?? 0)", genres: data.genres ?? [Genre](), length: "\(data.runtime ?? 0)", language: data.spokenLanguages ?? [SpokenLanguage]()))))
                self.success?()
            }
        }
    }
}
