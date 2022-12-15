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
    
    var transaccion: Transaccion?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(transaccion: Transaccion) {
        switch transaccion.tipo {
        case Tipo.gasto.rawValue:
            montoLabel.text = "-$" + String(transaccion.cantidad)
            montoLabel.textColor = .systemRed
            categoryIconImageView.tintColor = .systemRed
        case Tipo.ingreso.rawValue:
            montoLabel.text = "$" + String(transaccion.cantidad)
            montoLabel.textColor = .systemGreen
            categoryIconImageView.tintColor = .systemGreen
        default:
            print("Invalid cell")
        }
        
        nameLabel.text = transaccion.nombre
        
        self.transaccion = transaccion
    }
}
