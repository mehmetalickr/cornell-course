//
//  ShapeCollectionViewCell.swift
//  LectureFive
//
//  Created by Mehmet Ali ÇAKIR on 26.02.2022.
//

import UIKit

class ShapeCollectionViewCell: UICollectionViewCell {
    
    private var shapesImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        
        shapesImageView.contentMode = .scaleAspectFit
        shapesImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(shapesImageView)
        
        setupConstraints()
    }
    
    func configure(for shape: Shape) {
        shapesImageView.image = shape.getImage()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            shapesImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            shapesImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            shapesImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shapesImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
