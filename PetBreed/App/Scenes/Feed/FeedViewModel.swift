//
//  FeedViewModel.swift
//  PetBreed
//
//  Created by Diggo Silva on 10/10/24.
//

import Foundation

class FeedViewModel {
    var listOfListOfAnimals: [Animal] = []
    
    func numbersOfSections() -> Int {
        return listOfListOfAnimals.count
    }
    
    func numbersOfRowsInSections(section: Int) -> Int {
        return listOfListOfAnimals.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Animal {
        return listOfListOfAnimals[indexPath.row]
    }
    
    func titleForHeaderInSection(section: Int) -> String {
        return ""
    }
}
