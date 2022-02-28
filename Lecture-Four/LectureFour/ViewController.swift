//
//  ViewController.swift
//  LectureFour
//
//  Created by Mehmet Ali ÇAKIR on 25.02.2022.
//

import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()

    let reuseIdentifier = "cafeteriaCellReuse"
    let cellHeight: CGFloat = 50
    
    var cafeterias: [Cafeteria] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cafeterias"
        view.backgroundColor = .white
        
        let okenshields = Cafeteria(name: "okenshields", isFavorite: false, rating: .terrible)
        let rpcc = Cafeteria(name: "rpcc", isFavorite: false, rating: .moderate)
        let appel = Cafeteria(name: "appel", isFavorite: false, rating: .moderate)
        let becker = Cafeteria(name: "becker", isFavorite: false, rating: .moderate)
        cafeterias = [okenshields, rpcc, appel, becker]

        // Initialize tableView
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CafeteriaTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)

        setupConstraints()
    }

    func setupConstraints() {
        //Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cafeterias.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CafeteriaTableViewCell {
            let cafeteria = cafeterias[indexPath.row]
            cell.configure(cafeteria: cafeteria)
            cell.selectionStyle = .none
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cafeteria = cafeterias[indexPath.row]
        cafeteria.isFavorite.toggle()
        if let cell = tableView.cellForRow(at: indexPath) as? CafeteriaTableViewCell {
            cell.toggleHeart(isFavorite: cafeteria.isFavorite)
        } else {
            
        }
    }
    
}

