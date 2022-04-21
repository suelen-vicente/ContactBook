//
//  ContactTableViewCell.swift
//  ContactBook
//
//  Created by Suelen Vicente on 2022-04-20.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var contactEmailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
