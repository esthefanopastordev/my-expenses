//
//  AddTransactionViewController.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 5/12/22.
//

import UIKit

protocol FormTransaccionViewProtocol {
    
}

class FormTransaccionViewController: UIViewController {
    private var tipoTransaccion: String = Tipo.gasto.rawValue
    
    var presenter: FormTransaccionPresenterProtocol?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var typeButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.shadowImage = UIImage() // Remove default navigation bar shadow
        setupTypeButton()
    }

    @IBAction func didCancelTap(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func didDoneTap(_ sender: UIBarButtonItem) {
        presenter?.didDoneTap()
    }
}

extension FormTransaccionViewController: FormTransaccionViewProtocol {
    
}

extension FormTransaccionViewController {
    func setupTypeButton() {
        let optionHandler = { (action: UIAction) in self.tipoTransaccion = action.title }
        typeButton.menu = UIMenu(children : [
            UIAction(title: Tipo.gasto.rawValue, state: .on, handler: optionHandler),
            UIAction(title: Tipo.ingreso.rawValue, handler: optionHandler),
        ])
        typeButton.showsMenuAsPrimaryAction = true
        typeButton.changesSelectionAsPrimaryAction = true
    }
}
