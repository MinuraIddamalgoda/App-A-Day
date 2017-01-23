//
//  PostTableViewCell.swift
//  6 - Jason The Recycler Part II
//
//  Created by Minura Iddamalgoda on 23/1/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var userId_idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
