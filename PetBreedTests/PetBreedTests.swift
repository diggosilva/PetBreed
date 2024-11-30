//
//  PetBreedTests.swift
//  PetBreedTests
//
//  Created by Diggo Silva on 30/11/24.
//

import XCTest
@testable import PetBreed

final class PetBreedTests: XCTestCase {
    
    var sut: FeedViewModel!
    
    override func setUp() {
        super.setUp()
        sut = FeedViewModel()
    }
    
    func testNumberOfSectionsWhenNoAnimalsAddedReturnsZero() {
        let result = sut.numbersOfSections()
        XCTAssertEqual(result, 0)
    }
    
    func testNumberOfSectionsWhenAnimalsAddedReturnsCorrectCount() {
        sut.addAnimal(animalType: .dog, breed: "poddle")
        sut.addAnimal(animalType: .cat, breed: "persa")
        let result = sut.numbersOfSections()
        XCTAssertEqual(result, 2)
    }
    
    func testNumberOfRowsInSection() {
        sut.addAnimal(animalType: .dog, breed: "beagle")
        sut.addAnimal(animalType: .dog, breed: "bulldog")
        sut.addAnimal(animalType: .cat, breed: "siames")
        
        let numberOfDogs = sut.numbersOfRowsInSections(section: 0)
        let numberOfCats = sut.numbersOfRowsInSections(section: 1)
        
        XCTAssertEqual(numberOfDogs, 2)
        XCTAssertEqual(numberOfCats, 1)
    }
    
    func testCellForRowAt() {
        sut.addAnimal(animalType: .dog, breed: "beagle")
        sut.addAnimal(animalType: .cat, breed: "siames")
        
        let firstAnimal = sut.cellForRowAt(indexPath: IndexPath(row: 0, section: 0))
        let secondAnimal = sut.cellForRowAt(indexPath: IndexPath(row: 0, section: 1))
        
        XCTAssertEqual(firstAnimal.breed, "beagle")
        XCTAssertEqual(secondAnimal.breed, "siames")
    }
    
    func testTitleForHeader() {
        sut.addAnimal(animalType: .dog, breed: "beagle")
        sut.addAnimal(animalType: .cat, breed: "siames")
        sut.addAnimal(animalType: .bird, breed: "Papagaio")
        
        let titleFordog = sut.titleForHeaderInSection(section: 0)
        let titleForCat = sut.titleForHeaderInSection(section: 1)
        let titleForBird = sut.titleForHeaderInSection(section: 2)
        
        XCTAssertEqual(titleFordog, "Cães")
        XCTAssertEqual(titleForCat, "Gatos")
        XCTAssertEqual(titleForBird, "Aves")
    }
    
    func testAddAnimalCreatesNewSectionWhenTypeDoesNotExist() {
        sut.addAnimal(animalType: .bird, breed: "Papagaio")
        
        let numberOfSections = sut.numbersOfSections()
        let numberOfRowInSection = sut.numbersOfRowsInSections(section: 0)
        
        XCTAssertEqual(numberOfSections, 1)
        XCTAssertEqual(numberOfRowInSection, 1)
    }
    
    func testAddAnimalAddsAnimalToExistingSection() {
        sut.addAnimal(animalType: .dog, breed: "beagle")
        sut.addAnimal(animalType: .dog, breed: "bulldog")
        
        let numberOfSections = sut.numbersOfSections()
        let numberOfRowInSection = sut.numbersOfRowsInSections(section: 0)
        
        XCTAssertEqual(numberOfSections, 1)
        XCTAssertEqual(numberOfRowInSection, 2)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}
