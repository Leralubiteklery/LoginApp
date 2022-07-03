//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Lera Savchenko on 3.07.22.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var logOutButton: UIButton!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeLabel.text = "Welcome, \(userName!)"
    }
    

    @IBAction func logOutButtonTapped() {
        dismiss(animated: true)
    }
    
}
