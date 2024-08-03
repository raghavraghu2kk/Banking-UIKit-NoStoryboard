//
//  ViewController.swift
//  Bankey
//
//  Created by Raghavendra Mirajkar on 01/08/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let captionLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("View did load")
        style()
        layout()
        // Do any additional setup after loading the view.
    }

}

extension LoginViewController {
    private func style() {
        // Always set it to false - TAMC
        // This makes it ready for autolayout - If you don't autolayout doesn't work.
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Bankey"
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.text = """
                            Your premium source for all
                            things banking!
                            """
        captionLabel.textAlignment = .center
        captionLabel.numberOfLines = 2
        captionLabel.font = .systemFont(ofSize: 20)
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 //For indicator spacing
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(captionLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //Labels - Title and  secondary title
        NSLayoutConstraint.activate([
            captionLabel.topAnchor.constraint(equalTo: loginView.topAnchor, constant: -70),
            captionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: captionLabel.topAnchor, constant: -50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        //LoginView - Layout
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
            
        ])
        
        NSLayoutConstraint.activate([
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            signInButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 16),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            errorMessageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}

// MARK: - Methods

extension LoginViewController {
    
    @objc private func signInTapped() {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        print("Did enter")
        guard let username = username, let password = password else {
            assertionFailure("Username / Password should never be nil")
            return
        }
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / Password cannot be blank.")
            return
        }
        
        if username == "Kevin" && password == "Welcome" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect credentials.")
        }
    }
    
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
}

// MARK: - UIView Controller Lifecycle
extension LoginViewController {
    override func viewWillAppear(_ animated: Bool) {
        print("UIView will Appear")
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        print("UIView is Appearing")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("UIView did Appear")
    }
    
    override func viewWillLayoutSubviews() {
        print("UIView will change its layout - Used to update the layout constraints")
    }
    
    override func viewDidLayoutSubviews() {
        print("UIView did change the layout - Good place to do any final adjustments")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("UIView Will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("UIView did Disappear")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("UIView will transition (Roatation of screen)")
    }
    
    override func didReceiveMemoryWarning() {
        print("Sent the memory warning to UIView Controller - Place to release any cached data")
    }
}

