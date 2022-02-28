//
//  HeaderView.swift
//  LectureFive
//
//  Created by Mehmet Ali ÇAKIR on 26.02.2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        setupConstraints()
        
    }
    
    func configure(for sectionName: String) {
        label.text = sectionName
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
