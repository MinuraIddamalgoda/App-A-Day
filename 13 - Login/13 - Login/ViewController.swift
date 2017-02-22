//
//  ViewController.swift
//  13 - Login
//
//  Created by Minura Iddamalgoda on 22/2/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var signUpLabel: UILabel!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var blurVisualEffect: UIVisualEffectView!
    
    // MARK: - Actions
    @IBAction func logInTapped(_ sender: UIButton) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up views for animating in
        logoImageView.alpha = 0.0
        loginButton.alpha = 0.0
        loginButton.transform = CGAffineTransform(translationX: 0, y: 75)
        signUpLabel.alpha = 0.0
        signUpLabel.transform = CGAffineTransform(translationX: 0, y: 125)
        blurVisualEffect.alpha = 0.0
        
        
        // Setting up TapGestureRecognizer
        let signUpTap = UITapGestureRecognizer.init(target: self, action: #selector(signUpTapped))
        signUpLabel.addGestureRecognizer(signUpTap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5) { 
            self.blurVisualEffect.alpha = 1.0
        }
        
        UIView.animate(withDuration: 1.0, delay: 0.5, animations: {
            self.logoImageView.alpha = 1.0
        })
        
        UIView.animate(withDuration: 0.8, delay: 0.6, animations: {
            self.loginButton.transform = CGAffineTransform.identity
            self.loginButton.alpha = 1.0
            self.signUpLabel.transform = CGAffineTransform.identity
            self.signUpLabel.alpha = 1.0
        })
    }
    
    func signUpTapped() {
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

