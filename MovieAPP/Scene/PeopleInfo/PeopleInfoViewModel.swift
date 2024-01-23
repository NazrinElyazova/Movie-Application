//
//  PeopleInfoViewModel.swift
//  MovieAPP
//
//  Created by Nazrin on 22.12.23.
//

import Foundation

class PeopleInfoViewModel {
    var infoItems = [Cast]()
    let manager = PeopleInfoManager()
    
    var peopleID: Int
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    init(peopleID: Int) {
        self.peopleID = peopleID
    }
    
    func getInfoList() {
        manager.getPeopleInfo(endpoint: .peopleInfo, peopleID: peopleID) {
            data, errorMessage in
            if let errorMessage = errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.infoItems.append(contentsOf: data.cast ?? [])
                self.success?()
            }
        }
    }
}
