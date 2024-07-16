//
//  WeatherViewCell.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 16.07.2024.
//

import UIKit

final class WeatherViewCell: UICollectionViewCell {

    // MARK: - Public Properties

    static let reuseIdent = "WeatherViewCell"

    // MARK: - Private Properties

    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .boldSystemFont(ofSize: 17)
        nameLabel.textColor = .blue
        nameLabel.layer.borderWidth = 1

        return nameLabel
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        setupNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configCell(with name: String) {
        nameLabel.text = NSLocalizedString(name, comment: "")
    }

    // MARK: - Private Methods

    private func setupNameLabel() {
        contentView.addSubview(nameLabel)

        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
