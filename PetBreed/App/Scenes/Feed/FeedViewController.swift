//
//  FeedViewController.swift
//  PetBreed
//
//  Created by Diggo Silva on 08/10/24.
//

import UIKit

class FeedViewController: UIViewController {
    
    let feedView = FeedView()
    
    override func loadView() {
        super.loadView()
        view = feedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        setDelegatesAndDataSources()
    }
    
    private func setNavBar() {
        title = "Raça dos Pets"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector (addButtonTapped))
    }
    
    private func setDelegatesAndDataSources() {
        feedView.tableView.delegate = self
        feedView.tableView.dataSource = self
    }
    
    @objc private func addButtonTapped() {
        print("Toco no botão ADD")
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.identifier, for: indexPath) as? FeedCell else { return UITableViewCell() }
//        cell.textLabel?.text  = "Hello World"
        return cell
    }
}

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

class FeedViewModel {
    var listOfListOfAnimals: [Animal] = []
    
    func numbersOfSections() -> Int {
        return listOfListOfAnimals.count
    }
    
    func numbersOfRowsInSections(section: Int) -> Int {
        return 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Animal {
        return listOfListOfAnimals[indexPath.row]
    }
    
    func titleForHeaderInSection(section: Int) -> String {
        return ""
    }
}
