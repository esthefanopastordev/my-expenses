//
//  TransactionDetailsViewController.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 5/12/22.
//

import UIKit

class DetalleTransaccionViewController: UIViewController {
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    
    var transaction: TransaccionResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        navigationBar.prefersLargeTitles = true
        navigationBar.shadowImage = UIImage() // Remove default navigation bar shadow
    }
    
    @IBAction func deleteTapped(_ sender: UIBarButtonItem) {
        // TODO: eliminar transaccion
    }
    
}

extension DetalleTransaccionViewController {
    func setup() {
        titleNavigationItem.title = transaction?.descripcion
        amountLabel.text = "$\(transaction?.cantidad ?? 0.00)"
        typeLabel.text = transaction?.tipo
        dateLabel.text = transaction?.fecha
        categoryNameLabel.text = transaction?.categoriaId
        descriptionTextView.text = transaction?.nota
    }
}
