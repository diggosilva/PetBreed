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
    }
    
    private func setDelegatesAndDataSources() {
        feedView.tableView.delegate = self
        feedView.tableView.dataSource = self
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

class FeedView: UIView {
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(FeedCell.self, forCellReuseIdentifier: FeedCell.identifier)
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        backgroundColor = .systemBackground
        addSubview(tableView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

class FeedCell: UITableViewCell {
    static let identifier: String = "FeedCell"
    
    lazy var petImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: "person.crop.circle")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var breedLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .preferredFont(forTextStyle: .subheadline)
        lbl.text = "Breed"
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy () {
        addSubview(petImage)
        addSubview(breedLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            petImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            petImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            petImage.widthAnchor.constraint(equalToConstant: 40),
            petImage.heightAnchor.constraint(equalTo: petImage.widthAnchor),
            
            breedLabel.leadingAnchor.constraint(equalTo: petImage.trailingAnchor, constant: 16),
            breedLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
