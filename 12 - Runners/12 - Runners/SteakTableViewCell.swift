//
//  SteakTableViewCell.swift
//  12 - Runners
//
//  Created by Minura Iddamalgoda on 13/2/17.
//  Copyright © 2017 Minura Iddamalgoda. All rights reserved.
//

import UIKit

class SteakTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stockRemainingLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    
    // MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
