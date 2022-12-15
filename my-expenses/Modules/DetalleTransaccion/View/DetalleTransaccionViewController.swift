//
//  TransactionDetailsViewController.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 5/12/22.
//

import UIKit

protocol DetalleTransaccionViewProtocol {
    
}

class DetalleTransaccionViewController: UIViewController {
    var presenter: DetalleTransaccionPresenterProtocol?

    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var titleNavigationItem: UINavigationItem!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.prefersLargeTitles = true
        navigationBar.shadowImage = UIImage() // Remove default navigation bar shadow
    }
    
    @IBAction func didDeleteTap(_ sender: UIBarButtonItem) {
        presenter?.didDeleteTap()
    }
}

extension DetalleTransaccionViewController {
    func setup() {
        let transaction = presenter?.getDetalle()

        titleNavigationItem.title = transaction?.descripcion
        amountLabel.text = "$\(transaction?.cantidad ?? 0.00)"
        typeLabel.text = transaction?.tipo
        dateLabel.text = transaction?.fecha
        categoryNameLabel.text = transaction?.categoriaId
        descriptionTextView.text = transaction?.nota
    }
}

extension DetalleTransaccionViewController: DetalleTransaccionViewProtocol {
    
}
