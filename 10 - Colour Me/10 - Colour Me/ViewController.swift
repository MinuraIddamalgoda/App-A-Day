//
//  ViewController.swift
//  10 - Colour Me
//
//  Created by Minura Iddamalgoda on 30/1/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    // MARK: Tap Gesture Recognisers
    @IBOutlet var greenTapRecog: UITapGestureRecognizer!
    @IBOutlet var redTapRecog: UITapGestureRecognizer!
    @IBOutlet var purpleTapRecog: UITapGestureRecognizer!
    @IBOutlet var blackTapRecog: UITapGestureRecognizer!
    @IBOutlet var pinkTapRecog: UITapGestureRecognizer!
    @IBOutlet var blueTapRecog: UITapGestureRecognizer!
    
    // MARK: Stack Views
    @IBOutlet weak var greenStackView: UIStackView!
    @IBOutlet weak var redStackView: UIStackView!
    @IBOutlet weak var purpleStackView: UIStackView!
    @IBOutlet weak var blackStackView: UIStackView!
    @IBOutlet weak var pinkStackView: UIStackView!
    @IBOutlet weak var blueStackView: UIStackView!
    

    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up gesture recognisers
        let greenTap = UITapGestureRecognizer.init(target: self, action: #selector(self.greenStackTapped))
        let redTap = UITapGestureRecognizer.init(target: self, action: #selector(self.redStackTapped))
        let purpleTap = UITapGestureRecognizer.init(target: self, action: #selector(self.purpleStackTapped))
        let blackTap = UITapGestureRecognizer.init(target: self, action: #selector(self.blackStackTapped))
        let pinkTap = UITapGestureRecognizer.init(target: self, action: #selector(self.pinkStackTapped))
        let blueTap = UITapGestureRecognizer.init(target: self, action: #selector(self.blueStackTapped))
        
        // Connect gesture recognisers to stack views
        greenStackView.addGestureRecognizer(greenTap)
        
        redStackView.addGestureRecognizer(redTap)
        
        purpleStackView.addGestureRecognizer(purpleTap)
        
        blackStackView.addGestureRecognizer(blackTap)
        
        pinkStackView.addGestureRecognizer(pinkTap)
        
        blueStackView.addGestureRecognizer(blueTap)
    }
    
    func greenStackTapped() {
        print("Green Tapped")
    }
    
    func redStackTapped() {
        print("Red Tapped")
    }
    
    func purpleStackTapped() {
        print("Purple Tapped")
    }
    
    func blackStackTapped() {
        print("Black Tapped")
    }
    
    func pinkStackTapped() {
        print("Pink Tapped")
    }
    
    func blueStackTapped() {
        print("Blue Tapped")
    }

}

