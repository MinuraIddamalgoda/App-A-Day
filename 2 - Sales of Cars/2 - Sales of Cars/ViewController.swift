//
//  ViewController.swift
//  2 - Sales of Cars
//
//  Created by Minura Iddamalgoda on 12/1/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController:
    UIViewController,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    // I have no idea why I needed that UINavigationControllerDelegate above,
    // all I know is that the code breaks if I don't have it. Welcome to
    // iOS Dev.
    
    // MARK: - Variables
    var chosenImage: UIImage!
    
    // MARK: - Programatically created views
    let picker = UIImagePickerController()
    
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    // MARK: - Actions
    @IBAction func selectPhotoPressed(_ sender: UIButton) {
        photoFromLibrary(sender: sender)
    }
    
    @IBAction func registerCar(_ sender: UIButton) {
        createCarObject(name: nameTextField.text!, year: Int(yearTextField.text!)!, price: Float(priceTextField.text!)!)
    }
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)

    }
    
    @IBAction func photoFromLibrary(sender: UIButton) {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
        
    }
    
    func createCarObject(name: String, year: Int, price: Float) {
        let newCar = Car()
        newCar.name = name
        newCar.year = year
        newCar.price = price
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(newCar)
        }
        
        
    }
    
    // MARK: - Delegates
    // MARK: UIImagePickerController methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        print("image chosen")
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

