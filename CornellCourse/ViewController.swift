//
//  ViewController.swift
//  CornellCourse
//
//  Created by Mehmet Ali ÇAKIR on 24.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var nameLabel = UILabel()
    var profileImageView = UIImageView()
    var followButton = UIButton()
    var bioTextView = UITextView()
    var commentTextField = UITextField()
    
    var isFollowing = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        nameLabel.text = "Jeff Bezos"
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 30, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        profileImageView.image = UIImage(named: "jeff")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 5
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImageView)
        
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitleColor(.systemBlue, for: .normal)
        followButton.layer.borderWidth = 1
        followButton.layer.borderColor = UIColor.systemBlue.cgColor
        followButton.layer.cornerRadius = 10
        followButton.translatesAutoresizingMaskIntoConstraints = false
        followButton.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        view.addSubview(followButton)
        
        commentTextField.placeholder = "Comment here"
        commentTextField.textColor = .black
        commentTextField.font = .systemFont(ofSize: 15)
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(commentTextField)
        
        bioTextView.text = "Entrepreneur and e-commerce pioneer Jeff Bezos is the founder and CEO of the e-commerce company Amazon, owner of The Washington Post and founder of the space exploration company Blue Origin. His successful business ventures have made him one of the richest people in the world. Born in 1964 in New Mexico, Bezos had an early love of computers and studied computer science and electrical engineering at Princeton University. After graduation, he worked on Wall Street, and in 1990 he became the youngest senior vice president at the investment firm D.E. Shaw. Four years later, Bezos quit his lucrative job to open Amazon.com, an online bookstore that became one of the Internet's biggest success stories. In 2013, Bezos purchased The Washington Post, and in 2017 Amazon acquired Whole Foods. In February 2021, Amazon announced that Bezos will step down as CEO in the third quarter of the year."
        bioTextView.font = .systemFont(ofSize: 15)
        bioTextView.textAlignment = .left
        bioTextView.textColor = .black
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bioTextView)
        
        setupConstraints()
    }
    
    @objc func followButtonTapped() {
        if !isFollowing {
            isFollowing = true
            followButton.setTitle("Following", for: .normal)
        } else {
            isFollowing = false
            followButton.setTitle("Follow", for: .normal)
        }
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            profileImageView.heightAnchor.constraint(equalToConstant: 200),
            profileImageView.widthAnchor.constraint(equalToConstant: 200),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            followButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 20),
            followButton.heightAnchor.constraint(equalToConstant: 50),
            followButton.widthAnchor.constraint(equalToConstant: 100),
            followButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            commentTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            commentTextField.heightAnchor.constraint(equalToConstant: 17),
            commentTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            commentTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            bioTextView.topAnchor.constraint(equalTo: followButton.bottomAnchor, constant: 20),
            bioTextView.bottomAnchor.constraint(equalTo: commentTextField.topAnchor, constant: -20),
            bioTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bioTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

}

