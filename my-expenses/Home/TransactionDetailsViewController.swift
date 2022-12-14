//
//  TransactionDetailsViewController.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 5/12/22.
//

import UIKit

protocol TransactionDetailsViewControllerDelegate {
    func transactionDetailsView(_ transactionDetailsView: TransactionDetailsViewController, didRemoveTransaction transactionId: String)
}

class TransactionDetailsViewController: UIViewController {
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var transaction: Transaccion?
    var delegate: TransactionDetailsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func deleteTapped(_ sender: UIBarButtonItem) {
        guard let transactionId = transaction?.id else { return }
        
        delegate?.transactionDetailsView(self, didRemoveTransaction: transactionId)
        
        dismiss(animated: true)
    }
    
}

extension TransactionDetailsViewController {
    func setup() {
        amountLabel.text = "$\(transaction?.cantidad ?? 0.00)"
        nameLabel.text = transaction?.nombre
        typeLabel.text = transaction?.tipo
        // TODO: Obtener el resto de datos
        dateLabel.text = "Lunes 05 de Diciembre 2022"
        categoryNameLabel.text = "Transporte"
        descriptionTextView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla placerat odio vitae elementum vulputate."
    }
}
