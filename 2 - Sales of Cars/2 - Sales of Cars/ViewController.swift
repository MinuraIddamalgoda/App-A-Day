//
//  ViewController.swift
//  2 - Sales of Cars
//
//  Created by Minura Iddamalgoda on 12/1/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class ViewController:
    UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    // I have no idea why I needed that UINavigationControllerDelegate above,
    // all I know is that the code breaks if I don't have it. Welcome to
    // iOS Dev.
    
    // MARK: - Outlets
    
    
    // MARK: Variables
    let picker = UIImagePickerController()
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
    }
    
    // MARK: - Delegates
    // MARK: UIImagePickerController methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    
    @IBAction func photoFromLibrary(sender: UIButton) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
        
    }
}

