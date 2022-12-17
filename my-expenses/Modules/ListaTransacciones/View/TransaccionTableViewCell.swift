//
//  TransactionTableViewCell.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 4/12/22.
//

import UIKit

class TransaccionTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var montoLabel: UILabel!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryIconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(_ transaccion: TransaccionViewModel) {
        if (transaccion.tipo == "Gasto") {
            montoLabel.text = "-$\(transaccion.cantidad)"
            montoLabel.textColor = .systemRed
            categoryIconImageView.tintColor = .systemRed
        } else if (transaccion.tipo == "Ingreso") {
            montoLabel.text = "$\(transaccion.cantidad)"
            montoLabel.textColor = .systemGreen
            categoryIconImageView.tintColor = .systemGreen
        }

        nameLabel.text = transaccion.descripcion
        categoryNameLabel.text = transaccion.categoria
    }
}
