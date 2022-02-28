//
//  CafeteriaTableViewCell.swift
//  LectureFour
//
//  Created by Mehmet Ali ÇAKIR on 25.02.2022.
//

import UIKit

class CafeteriaTableViewCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var ratingLabel = UILabel()
    var heartImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        nameLabel.font = .systemFont(ofSize: 14)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        
        ratingLabel.font = .systemFont(ofSize: 12)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ratingLabel)
        
        heartImageView.image = UIImage(named: "heart")
        heartImageView.contentMode = .scaleAspectFit
        heartImageView.isHidden = true
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(heartImageView)
        
        setupConstraints()
    }
    
    func configure(cafeteria: Cafeteria) {
        nameLabel.text = cafeteria.name
        ratingLabel.text = "Rating: \(cafeteria.getRatingString())"
    }
    
    func setupConstraints() {
        let padding: CGFloat = 8
        let labelHeight: CGFloat = 20
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            ratingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            ratingLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        NSLayoutConstraint.activate([
            heartImageView.heightAnchor.constraint(equalToConstant: 16),
            heartImageView.widthAnchor.constraint(equalToConstant: 16),
            heartImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            heartImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
        
    }
    
    func toggleHeart(isFavorite: Bool) {
        heartImageView.isHidden = !isFavorite
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
