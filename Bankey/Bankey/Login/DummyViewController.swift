//
//  DummyViewController.swift
//  Bankey
//
//  Created by Raghavendra Mirajkar on 04/08/24.
//

import UIKit

class DummyViewController: UIViewController {
    
    let stackView = UIStackView()
    let welcomeLabel = UILabel()
    let logoutButton = UIButton(type: .system)
    
    weak var delegate : LogoutDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        layout()
    }
    
    func setUp() {
        view.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 32
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.setTitle("Log Out", for: [])
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Welcome"
        welcomeLabel.font = UIFont.systemFont(ofSize: 20)
        
        stackView.addArrangedSubview(welcomeLabel)
    }
    
    func layout() {
        view.addSubview(logoutButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackView.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 16),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func logoutButtonTapped(sender: UIButton) {
        print("LogOut Tapped")
        delegate?.didLogout()
    }

}

