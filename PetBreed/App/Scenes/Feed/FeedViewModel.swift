//
//  FeedViewModel.swift
//  PetBreed
//
//  Created by Diggo Silva on 10/10/24.
//

import Foundation

class FeedViewModel {
    var listOfListOfAnimals: [[Animal]] = []
    
    func numbersOfSections() -> Int {
        return listOfListOfAnimals.count
    }
    
    func numbersOfRowsInSections(section: Int) -> Int {
        return listOfListOfAnimals[section].count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Animal {
        return listOfListOfAnimals[indexPath.section][indexPath.row]
    }
    
    func titleForHeaderInSection(section: Int) -> String {
        if !listOfListOfAnimals[section].isEmpty {
            if listOfListOfAnimals[section].contains(where: { $0.type == .cat }) {
                return "Gatos"
            }
            
            if listOfListOfAnimals[section].contains(where: { $0.type == .dog }) {
                return "Cães"
            }
            
            if listOfListOfAnimals[section].contains(where: { $0.type == .bird }) {
                return "Aves"
            }
        }
        return ""
    }
    
    func addAnimal(animalType: AnimalType, breed: String) {
        let animal = Animal(type: animalType, breed: breed)
        var addedSection = false
        
        for (index, animalList) in listOfListOfAnimals.enumerated() {
            if animalType == .cat && animalList.contains(where: { $0.type == .cat }) ||
                animalType == .dog && animalList.contains(where: { $0.type == .dog }) ||
                animalType == .bird && animalList.contains(where: { $0.type == .bird }) {
                listOfListOfAnimals[index].append(animal)
                addedSection = true
                break
            }
        }
        
        if !addedSection {
            listOfListOfAnimals.append([animal])
        }
    }
}
