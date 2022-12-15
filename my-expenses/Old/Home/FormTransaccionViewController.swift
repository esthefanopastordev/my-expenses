//
//  AddTransactionViewController.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 5/12/22.
//

import UIKit

protocol FormTransaccionViewDelegate {
    func formTransaccionView(_ formTransaccionView: FormTransaccionViewController, didCreateTransaction nuevaTransaccion: Transaccion)
}

class FormTransaccionViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var typeButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var transactionType: String?
    var delegate: FormTransaccionViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTypeButton()
        navigationBar.shadowImage = UIImage() // Remove default navigation bar shadow
    }
    
    func setupTypeButton() {
        let optionClosure = { (action: UIAction) in self.transactionType = action.title }
        
        typeButton.menu = UIMenu(children : [
            UIAction(title: "Gasto", state: .on, handler: optionClosure),
            UIAction(title: "Ingreso", handler: optionClosure),
        ])
        typeButton.showsMenuAsPrimaryAction = true
        typeButton.changesSelectionAsPrimaryAction = true
    }
    
    @IBAction func didCancelTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func didDoneTap(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text, !name.isEmpty else { return }
        guard let amount = amountTextField.text, !amount.isEmpty else { return }
        guard let doubleAmount = Double(amount) else { return }
        guard let type = typeButton.titleLabel?.text else { return }

        let nuevaTransaccion = Transaccion(
            id: "0ffd4eaa-09a1-4846-87b4-07a683fd2975",
            nombre: name,
            cantidad: doubleAmount,
            fecha: "2022-12-14T21:44:12Z",
            categoriaId: "",
            tipo: type.lowercased(),
            descripcion: ""
        )
        
        delegate?.formTransaccionView(self, didCreateTransaction: nuevaTransaccion)
        
        dismiss(animated: true)
    }
}
