//
//  NetworkManager.swift
//  MovieAPP
//
//  Created by Nazrin on 05.12.23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    //Lazim olanlar url(endpoint), method, params(body), encoding, header, completion
    static func request<T:Codable>(model: T.Type,
                                   endpoint: String,
                                   method: HTTPMethod = .get,
                                   parameters: Parameters? = nil,
                                   encoding: ParameterEncoding = URLEncoding.default,
                                   completion: @escaping((T?, String?) -> Void)) {
        AF.request("\(NetworkHelper.baseURL)\(endpoint)",
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: NetworkHelper.header).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
                //                                print(data)
            case.failure(let error):
                completion(nil, error.localizedDescription)
                //                                print(response)
            }
        }
    }
}
