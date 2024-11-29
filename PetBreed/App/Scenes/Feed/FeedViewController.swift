//
//  FeedViewController.swift
//  PetBreed
//
//  Created by Diggo Silva on 08/10/24.
//

import UIKit

class FeedViewController: UIViewController {
    
    let feedView = FeedView()
    let viewModel = FeedViewModel()
    
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
        let alert = UIAlertController(title: "Adicionar Raça", message: "Digite o nome da raça", preferredStyle: .alert)
        alert.addTextField()
        
        let catAction = UIAlertAction(title: "Gato", style: .default, handler: { action in
            if let text = alert.textFields?.first?.text, !text.isEmpty {
                self.addAnimal(animalType: .cat, text: text)
            }
        })
        
        let dogAction = UIAlertAction(title: "Cachorro", style: .default, handler: { action in
            if let text = alert.textFields?.first?.text, !text.isEmpty {
                self.addAnimal(animalType: .dog, text: text)
            }
        })
        
        let birdAction = UIAlertAction(title: "Aves", style: .default) { action in
            if let text = alert.textFields?.first?.text, !text.isEmpty {
                self.addAnimal(animalType: .bird, text: text)
            }
        }
        alert.addAction(catAction)
        alert.addAction(dogAction)
        alert.addAction(birdAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
    }
    
    func addAnimal(animalType: AnimalType, text: String) {
        self.viewModel.addAnimal(animalType: animalType, breed: text)
        self.feedView.tableView.reloadData()
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numbersOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numbersOfRowsInSections(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.identifier, for: indexPath) as? FeedCell else { return UITableViewCell() }
        cell.configure(animal: viewModel.cellForRowAt(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeaderInSection(section: section)
    }
}
