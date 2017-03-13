//
//  ViewController.swift
//  15 - Proper Login
//
//  Created by Minura Iddamalgoda on 12/3/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class ViewController:
    UIViewController,
    UITextFieldDelegate {
    
    // MARK: - Instance Variables
    var screenWidth: CGFloat = CGFloat(0.0)
    var screenHeight: CGFloat = CGFloat(0.0)
    
    // MARK: - Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    // MARK: - Actions
    @IBAction func logInButtonTapped(_ sender: UIButton) {
        
    }
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setting up views for animation
        self.blurView.alpha = 0.0
        self.usernameTextField.alpha = 0.0
        self.passwordTextField.alpha = 0.0
        self.loginButton.alpha = 0.0
        self.signUpLabel.alpha = 0.0
        
        // Setting up delegates
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self

        
        screenWidth = scrollView.frame.size.width
        screenHeight = scrollView.frame.size.height
        
        animateIn()
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        let signUpTapGestureRecog = UITapGestureRecognizer(target: self, action: #selector(signUpTappged))
        signUpLabel.addGestureRecognizer(signUpTapGestureRecog)
    }
    
    func signUpTappged() {
        print("tapped")
        
        // Pan backgroundImageView
        
    }
    
    func animateIn() {
        UIView.animate(withDuration: 0.2) {
            self.blurView.alpha = 1.0
            self.usernameTextField.alpha = 1.0
            self.passwordTextField.alpha = 1.0
            self.loginButton.alpha = 1.0
            self.signUpLabel.alpha = 1.0
        }
    }
    
    // MARK: - UITextField Delegate Methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.usernameTextField:
            self.passwordTextField.becomeFirstResponder()
            break
        case self.passwordTextField:
            self.passwordTextField.resignFirstResponder()
            break
        default:
            return false
        }
        return true
    }
}

