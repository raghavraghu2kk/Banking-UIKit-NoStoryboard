//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Raghavendra Mirajkar on 03/08/24.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var heroImageName : String
    var titleText : String
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    //MARK: - Init Method
    init(heroImageName: String, titleText: String) {
        self.heroImageName = heroImageName
        self.titleText = titleText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension OnboardingViewController {
    //MARK: - Style
    private func style() {
        view.backgroundColor = .systemBackground
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        //ImageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: self.heroImageName)
        
        //LabelView
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = self.titleText
    }
    
    //MARK: - Layout
    private func layout() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}
