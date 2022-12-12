//
//  CategoriaTableViewCell.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 9/12/22.
//

import UIKit

class CategoriaTableViewCell: UITableViewCell {

    @IBOutlet weak var iconoImageView: UIImageView?
    @IBOutlet weak var nombreLabel: UILabel?
    @IBOutlet weak var numeroDeItemsLabel: UILabel?
    @IBOutlet weak var montoTotalLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
