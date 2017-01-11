//
//  ViewController.swift
//  1 - ScrollView With Buttons
//
//  Created by Minura Iddamalgoda on 11/1/17.
//
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    var images = [UIImageView]()

    // MARK: - Outlets 
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    // Can't get size of views in viewDidLoad(), only after they appear on
    // screen can you get their size
    override func viewDidAppear(_ animated: Bool) {
        
        var contentWidth: CGFloat = 0.0
        let scrollWidth = scrollView.frame.size.width
        let scrollHeight = scrollView.frame.size.height
        
        for x in 0...2 {
            let image = UIImage(named: "image\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75, y: (scrollHeight / 2) - 75, width: 150, height: 150)
        }
        
        contentWidth = scrollWidth * CGFloat(images.count)
        
        scrollView.clipsToBounds = true
        
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.size.height)
        
        print("Count:  \(images.count)")
    }


}

