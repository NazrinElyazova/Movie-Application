//
//  PeopleViewModel.swift
//  MovieAPP
//
//  Created by Nazrin on 08.12.23.
//

import Foundation

class PeopleViewModel {
    var items = [PeopleData]()
    
    var peopleData: People?
    let manager = PeopleManager()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getPeopleList() {
        manager.getPeopleList(pageNumber: (peopleData?.page ?? 0) + 1) {
            data, errorMessage in
            if let errorMessage {
                self.error? (errorMessage)
            } else if let data {
                self.peopleData = data
                self.items.append(contentsOf: data.results ?? [])
                self.success?()
            }
        }
    }
    
    func pagination(index: Int) {
        if index == items.count-1 && (peopleData?.page ?? 0 <= peopleData?.totalPages ?? 0) {
            print("+++++++")
            getPeopleList()
        }
    }
    
    func reset() {
        peopleData = nil
        items.removeAll()
    }
}
