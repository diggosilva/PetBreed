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
        return 2
    }
    
    func numbersOfRowsInSections(section: Int) -> Int {
        return listOfListOfAnimals.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Animal {
        return listOfListOfAnimals[indexPath.row]
    }
    
    func titleForHeaderInSection(section: Int) -> String {
        if section == 0 {
            return "Gatos"
        } else {
            return "Cães"
        }
    }
}
