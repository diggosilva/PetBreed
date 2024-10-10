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
                let catBreed = Animal(type: .cat, breed: text)
                self.viewModel.listOfListOfAnimals.append(catBreed)
                print("RaçaGatos: \(self.viewModel.listOfListOfAnimals)")
                self.feedView.tableView.reloadData()
            }
        })
        
        let dogAction = UIAlertAction(title: "Cachorro", style: .default, handler: { action in
            if let text = alert.textFields?.first?.text, !text.isEmpty {
                let dogBreed = Animal(type: .dog, breed: text)
                self.viewModel.listOfListOfAnimals.append(dogBreed)
                print("RaçaCães: \(self.viewModel.listOfListOfAnimals)")
                self.feedView.tableView.reloadData()
            }
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(catAction)
        alert.addAction(dogAction)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numbersOfRowsInSections(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.identifier, for: indexPath) as? FeedCell else { return UITableViewCell() }
        
        return cell
    }
}
