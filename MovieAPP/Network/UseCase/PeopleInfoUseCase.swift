//
//  PeopleInfoUseCase.swift
//  MovieAPP
//
//  Created by Nazrin on 22.12.23.
//

import Foundation

protocol PeopleInfoUseCase {
    func getPeopleInfo(endpoint: PeopleInfoEndpoint, peopleID: Int?, completion: @escaping((PeopleInfo?, String?) -> Void))
}
