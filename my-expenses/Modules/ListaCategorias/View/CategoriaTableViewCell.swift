//
//  CategoriaTableViewCell.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 9/12/22.
//

import UIKit

class CategoriaTableViewCell: UITableViewCell {
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var numeroDeItemsLabel: UILabel!
    @IBOutlet weak var iconoImageView: UIImageView!
    @IBOutlet weak var montoTotalLabel: UILabel!
    
    var categoria: Categoria?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(from categoria: Categoria) {
        switch categoria.tipo {
        case Tipo.gasto.rawValue:
            iconoImageView.tintColor = .systemRed
        case Tipo.ingreso.rawValue:
            iconoImageView.tintColor = .systemGreen
        default:
            print("Invalid cell")
        }
        
        nombreLabel.text = categoria.nombre
        montoTotalLabel.text = "$300"
        numeroDeItemsLabel.text = "3 items"
        
        self.categoria = categoria
    }
}
