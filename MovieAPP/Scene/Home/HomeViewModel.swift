//
//  HomeViewModel.swift
//  MovieAPP
//
//  Created by Nazrin on 08.12.23.
//

import Foundation

struct HomeModel {
    let title: String
    let movies: [MovieResult]
}

class HomeViewModel {
    
    var items = [HomeModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    private let manager = HomeManager()
    
    func getItems() {
        getMovies(title: "Now Playing", endpoint: HomeEndpoint.nowPlayingMovies)
        self.getMovies(title: "Popular", endpoint: HomeEndpoint.popularMovies)
        self.getMovies(title: "Top Rated", endpoint: HomeEndpoint.topratedMovies)
        self.getMovies(title: "Upcoming", endpoint: HomeEndpoint.upcomingMovies)
    }
    
    func getMovies(title: String, endpoint: HomeEndpoint) {
        manager.getMovieList(endpoint: endpoint) { data, errorMessage in
            if let errorMessage = errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.items.append(.init(title: title, movies: data.results ?? []))
                self.success?()
            }
        }
    }
}
