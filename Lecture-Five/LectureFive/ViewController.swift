//
//  ViewController.swift
//  LectureFive
//
//  Created by Mehmet Ali ÇAKIR on 26.02.2022.
//

import UIKit

class ViewController: UIViewController {

    private var collectionView: UICollectionView!
        
    // Data
    private var sections = ["Circle", "Triangle", "Star", "Umbrella"]
    private var shapes: [[Shape]] = [
        [Shape(imageName: "circle"), Shape(imageName: "circle"), Shape(imageName: "circle"), Shape(imageName: "circle")],
        [Shape(imageName: "triangle"), Shape(imageName: "triangle"), Shape(imageName: "triangle"), Shape(imageName: "triangle")],
        [Shape(imageName: "star"), Shape(imageName: "star"), Shape(imageName: "star"), Shape(imageName: "star")],
        [Shape(imageName: "umbrella"), Shape(imageName: "umbrella"), Shape(imageName: "umbrella"), Shape(imageName: "umbrella")]
    ]

    private let shapesCellReuseIdentifier = "shapesCellReuseIdentifier"
    private let headerReuseIdentifier = "headerReuseIdentifier"
    private let cellPadding: CGFloat = 10
    private let sectionPadding: CGFloat = 5
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shapes"
        view.backgroundColor = .white

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = cellPadding
        layout.minimumInteritemSpacing = cellPadding
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear

        collectionView.register(ShapeCollectionViewCell.self, forCellWithReuseIdentifier: shapesCellReuseIdentifier)

        collectionView.dataSource = self

        collectionView.delegate = self

        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)

        view.addSubview(collectionView)
        setupConstraints()
    }

    func setupConstraints() {
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: collectionViewPadding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -collectionViewPadding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding)
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shapes[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: shapesCellReuseIdentifier, for: indexPath) as! ShapeCollectionViewCell
        cell.configure(for: shapes[indexPath.section][indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! HeaderView
        header.configure(for: sections[indexPath.section])
        return header
    }
}
    
extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numOfRows: CGFloat = 2
        let size = (collectionView.frame.width - cellPadding) / numOfRows
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shape = shapes[indexPath.section][indexPath.item]
        shape.isSelected.toggle()
        collectionView.reloadData()
    }
}
