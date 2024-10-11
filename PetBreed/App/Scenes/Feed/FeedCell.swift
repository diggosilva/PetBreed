//
//  FeedCell.swift
//  PetBreed
//
//  Created by Diggo Silva on 09/10/24.
//

import UIKit

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
    
    func configure(animal: Animal) {
        switch animal.type {
        case .cat:
            petImage.image = UIImage(systemName: "cat.circle.fill")?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
            breedLabel.text = animal.breed.capitalized
        case .dog:
            petImage.image = UIImage(systemName: "dog.circle.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
            breedLabel.text = animal.breed.capitalized
        case .bird:
            petImage.image = UIImage(systemName: "bird.circle.fill")?.withTintColor(.systemYellow, renderingMode: .alwaysOriginal)
            breedLabel.text = animal.breed.capitalized
        }
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
