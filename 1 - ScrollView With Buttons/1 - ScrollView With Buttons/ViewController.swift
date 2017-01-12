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
    
    @IBOutlet var rightTapRecognizer: UITapGestureRecognizer!
    @IBOutlet var leftTapRecognizer: UITapGestureRecognizer!
    
    @IBOutlet weak var rightArrowImage: UIImageView!
    @IBOutlet weak var leftArrowImage: UIImageView!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting up tap recognisers
        let rightTap = UITapGestureRecognizer.init(target: self, action: #selector(self.respondToRightTap))
        rightArrowImage.addGestureRecognizer(rightTap)
        rightArrowImage.isUserInteractionEnabled = true
        
        let leftTap = UITapGestureRecognizer.init(target: self, action: #selector(self.respondToLeftTap))
        leftArrowImage.addGestureRecognizer(leftTap)
        leftArrowImage.isUserInteractionEnabled = true
    }
    
    // Can't get size of views in viewDidLoad(), only after they appear on
    // screen can you get their size
    override func viewDidAppear(_ animated: Bool) {
        
        // The dimensions of the scrollView
        let scrollWidth = scrollView.frame.size.width
        let scrollHeight = scrollView.frame.size.height
        // The width of the individual scrolling panels
        var contentWidth: CGFloat = 0.0
        
        // Three loops for three images
        for x in 0...2 {
            // Getting the image resource and casting it 
            // as a UIImageView
            let image = UIImage(named: "image\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            newX = scrollWidth / 2 + scrollWidth * CGFloat(x)
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: newX - 75, y: (scrollHeight / 2) - 75, width: 150, height: 150)
        }
        
        contentWidth = scrollWidth * CGFloat(images.count)
        
        scrollView.clipsToBounds = false
        
        scrollView.contentSize = CGSize(width: contentWidth, height: 1.0)
        
        print("Count:  \(images.count)")
    }

    // MARK: Tap Gesture Methods
    func respondToRightTap() {
        print("right tapped")
        let contentOffsetX = scrollView.contentOffset.x
        let contentOffsetY = scrollView.contentOffset.y
        let scrollWidth = scrollView.frame.width

        scrollView.setContentOffset(CGPoint(x: contentOffsetX + scrollWidth, y: contentOffsetY), animated: true)
    }
    
    func respondToLeftTap() {
        print("left tapped")
        let contentOffsetX = scrollView.contentOffset.x
        let contentOffsetY = scrollView.contentOffset.y
        let scrollWidth = scrollView.frame.width
        
        scrollView.setContentOffset(CGPoint(x: contentOffsetX - scrollWidth, y: contentOffsetY), animated: true)
    }

}

