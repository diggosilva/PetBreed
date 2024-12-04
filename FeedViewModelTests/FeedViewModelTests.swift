//
//  FeedViewModelTests.swift
//  FeedViewModelTests
//
//  Created by Diggo Silva on 03/12/24.
//

import XCTest
@testable import PetBreed

final class FeedViewModelTests: XCTestCase {
    
    var sut: FeedViewModel!
    
    override func setUp() {
        super.setUp()
        sut = FeedViewModel()
    }
    
    func testWhenUserAddDog() {
        sut.addAnimal(animalType: .dog, breed: "labrador")
        let numberOfSection = sut.numbersOfSections()
        let numberOfRowsInSection = sut.numbersOfRowsInSections(section: 0)
        let dogTitle = sut.titleForHeaderInSection(section: 0)
        let cellForRowAt = sut.cellForRowAt(indexPath: IndexPath(row: 0, section: 0))
        XCTAssertEqual(numberOfSection, 1)
        XCTAssertEqual(numberOfRowsInSection, 1)
        XCTAssertEqual(dogTitle, "Cães")
        XCTAssertEqual(cellForRowAt.breed, "labrador")
        XCTAssertEqual(cellForRowAt.type, .dog)
    }
    
    func testWhenHave3Sections() {
        sut.addAnimal(animalType: .dog, breed: "labrador")
        sut.addAnimal(animalType: .cat, breed: "persa")
        sut.addAnimal(animalType: .bird, breed: "tucano")
        let numberOfSections = sut.numbersOfSections()
        XCTAssertEqual(numberOfSections, 3)
    }
    
    func testWhenHave2Sections() {
        sut.addAnimal(animalType: .dog, breed: "labrador")
        sut.addAnimal(animalType: .cat, breed: "persa")
        let numberOfSections = sut.numbersOfSections()
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func testWhen1SectionHave2Cells() {
        sut.addAnimal(animalType: .dog, breed: "labrador")
        sut.addAnimal(animalType: .dog, breed: "bulldog")
        let firstDog = sut.cellForRowAt(indexPath: IndexPath(row: 0, section: 0))
        let secondDog = sut.cellForRowAt(indexPath: IndexPath(row: 1, section: 0))
        XCTAssertEqual(firstDog.breed, "labrador")
        XCTAssertEqual(secondDog.breed, "bulldog")
    }
    
    func testTitleForHeaderInSection() {
        sut.addAnimal(animalType: .dog, breed: "labrador")
        sut.addAnimal(animalType: .cat, breed: "persa")
        sut.addAnimal(animalType: .bird, breed: "tucano")
        let dogTitle = sut.titleForHeaderInSection(section: 0)
        let catTitle = sut.titleForHeaderInSection(section: 1)
        let birdTitle = sut.titleForHeaderInSection(section: 2)
        XCTAssertEqual(dogTitle, "Cães")
        XCTAssertEqual(catTitle, "Gatos")
        XCTAssertEqual(birdTitle, "Aves")
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}
