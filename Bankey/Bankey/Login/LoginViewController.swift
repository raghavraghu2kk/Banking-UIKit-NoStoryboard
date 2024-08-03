//
//  ViewController.swift
//  Bankey
//
//  Created by Raghavendra Mirajkar on 01/08/24.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        view.backgroundColor = .red
        // Do any additional setup after loading the view.
    }
    
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

