//
//  NetworkHelper.swift
//  MovieAPP
//
//  Created by Nazrin on 08.12.23.
//

import Foundation
import Alamofire

class NetworkHelper {
    static let header: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNGQ4MTRlY2RkY2YyMGI1NTkxODEyYzRjOGE0ZDU1ZCIsInN1YiI6IjY1OTc5OTVjNzI2ZmIxMTAxYWFiMjk0OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3_9IeAmVJjLzw1ZirkaaO3FTgxhl0gf0MBfIQyYcF0I"]
    
    static let baseURL = "https://api.themoviedb.org/3/"
    static let imagePath = "https://image.tmdb.org/t/p/original"
}
