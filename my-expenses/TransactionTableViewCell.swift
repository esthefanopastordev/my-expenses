//
//  TransactionTableViewCell.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 4/12/22.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var montoLabel: UILabel!
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    @IBOutlet weak var categoryIconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
