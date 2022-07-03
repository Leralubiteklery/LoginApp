//
//  ViewController.swift
//  LoginApp
//
//  Created by Lera Savchenko on 3.07.22.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet var userNameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    @IBAction func loginButtonTapped() {
    }
    
    @IBAction func forgotNameButtonTapped(_ sender: UIButton) {
        showAlert(with: "Oops!", and: "Your name is Alexei \u{1F609}")
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        showAlert(with: "Oops!", and: "Your password is Password \u{1F609}")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if userNameTF.text == "Alexei" && passwordTF.text == "Password" {
            guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
            welcomeVC.userName = userNameTF.text
        } else {
            showFailedLoginAlert(with: "Invalid login or password", and: "Please, enter correct login and password")
        }
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
}

// MARK: = UIAlertController
extension LogInViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showFailedLoginAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


