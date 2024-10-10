//
//  Animal.swift
//  PetBreed
//
//  Created by Diggo Silva on 10/10/24.
//

import Foundation

enum AnimalType: Int {
    case cat = 1
    case dog = 2
}

class Animal {
    var type: AnimalType
    var breed: String
    
    init(type: AnimalType, breed: String) {
        self.type = type
        self.breed = breed
    }
}
