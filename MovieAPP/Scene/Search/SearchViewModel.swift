//
//  SearchViewModel.swift
//  MovieAPP
//
//  Created by Nazrin on 09.12.23.
//

import Foundation

class SearchViewModel {
    var items = [SearchResult]()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getSearch(searchText: String) {
        let path = SearchEndpoint.searchMovie.rawValue + "?query=\(searchText)"
        NetworkManager.request(model: Search.self, endpoint: path) {
            data, errorMessage in
            if let errorMessage = errorMessage {
                self.error?(errorMessage)
            }
            else if let data {
                self.items = data.results ?? []
                self.success?()
            }
        }
    }
}
