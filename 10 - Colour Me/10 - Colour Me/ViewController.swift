//
//  ViewController.swift
//  10 - Colour Me
//
//  Created by Minura Iddamalgoda on 30/1/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class ViewController:
    UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    
    // MARK: - Variables
    var currentColorSelection: String = ""
    var imageSelected = false
    
    // MARK: - Outlets
    // MARK: Tap Gesture Recognisers
    @IBOutlet var greenTapRecog: UITapGestureRecognizer!
    @IBOutlet var redTapRecog: UITapGestureRecognizer!
    @IBOutlet var purpleTapRecog: UITapGestureRecognizer!
    @IBOutlet var blackTapRecog: UITapGestureRecognizer!
    @IBOutlet var pinkTapRecog: UITapGestureRecognizer!
    @IBOutlet var blueTapRecog: UITapGestureRecognizer!
    @IBOutlet var imageViewTapRecog: UITapGestureRecognizer!
    
    // MARK: Stack Views
    @IBOutlet weak var greenStackView: UIStackView!
    @IBOutlet weak var redStackView: UIStackView!
    @IBOutlet weak var purpleStackView: UIStackView!
    @IBOutlet weak var blackStackView: UIStackView!
    @IBOutlet weak var pinkStackView: UIStackView!
    @IBOutlet weak var blueStackView: UIStackView!
    
    // MARK: Everything else
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectColorButton: UIButton!
    
    // MARK: - Actions
    @IBAction func onSelectColorButtonClick(_ sender: UIButton) {
//        imageView.image = imageView.image!.withRenderingMode(.alwaysTemplate)
//        imageView.tintColor = UIColor.brown
        
        let originalImage = imageView.image
        let templateImage = originalImage?.withRenderingMode(.alwaysTemplate)
        imageView.image = templateImage
        imageView.tintColor = UIColor.red
    }
    
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
        let imageTap = UITapGestureRecognizer.init(target: self, action: #selector(self.pickImage))
        
        // Connect gesture recognisers to stack views
        greenStackView.addGestureRecognizer(greenTap)
        redStackView.addGestureRecognizer(redTap)
        purpleStackView.addGestureRecognizer(purpleTap)
        blackStackView.addGestureRecognizer(blackTap)
        pinkStackView.addGestureRecognizer(pinkTap)
        blueStackView.addGestureRecognizer(blueTap)
        imageView.addGestureRecognizer(imageTap)
        
    }
    
    // MARK: Color Selection Methods
    func greenStackTapped() {
        print("Green Tapped")
        currentColorSelection = "Green"
        updateButtonEnabled()
    }
    
    func redStackTapped() {
        print("Red Tapped")
        currentColorSelection = "Red"
        updateButtonEnabled()
    }
    
    func purpleStackTapped() {
        print("Purple Tapped")
        currentColorSelection = "Purple"
        updateButtonEnabled()
    }
    
    func blackStackTapped() {
        print("Black Tapped")
        currentColorSelection = "Black"
        updateButtonEnabled()
    }
    
    func pinkStackTapped() {
        print("Pink Tapped")
        currentColorSelection = "Pink"
        updateButtonEnabled()
    }
    
    func blueStackTapped() {
        print("Blue Tapped")
        currentColorSelection = "Blue"
        updateButtonEnabled()
    }
    
    // MARK: UIImageView Methods
    func pickImage() {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true) { 
            print("image picker shown successfully")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageSelected = true
            imageView.image = pickedImage
            updateButtonEnabled()
        } else {
            print("error in picking image")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    // UIButton Methods
    func updateButtonEnabled() {
        if (imageSelected == true && currentColorSelection == "") {
            selectColorButton.isEnabled = false
            selectColorButton.setTitle("No Color Selected", for: .disabled)
        } else if (imageSelected == false && currentColorSelection != "") {
            selectColorButton.isEnabled = false
            selectColorButton.setTitle("No Image Selected", for: .disabled)
        } else if (imageSelected == true && currentColorSelection != "") {
            selectColorButton.isEnabled = true
            selectColorButton.setTitle("Tint Image \(currentColorSelection)", for: .normal)
        }
    }
}

