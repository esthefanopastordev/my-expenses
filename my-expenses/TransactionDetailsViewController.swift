//
//  TransactionDetailsViewController.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 5/12/22.
//

import UIKit

class TransactionDetailsViewController: UIViewController {
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var transaction: Transaction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func deleteTapped(_ sender: UIBarButtonItem) {
        print("Delete tapped")
        
        dismiss(animated: true)
    }
    
}

extension TransactionDetailsViewController {
    func setup() {
        amountLabel.text = "$\(transaction?.amount ?? 0.00)"
        nameLabel.text = transaction?.name
        typeLabel.text = transaction?.type
        // TODO: Obtener el resto de datos
        dateLabel.text = "Lunes 05 de Diciembre 2022"
        categoryNameLabel.text = "Transporte"
        descriptionTextView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla placerat odio vitae elementum vulputate."
    }
}
