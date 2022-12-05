//
//  AddTransactionViewController.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 5/12/22.
//

import UIKit

protocol AddTransactionViewControllerDelegate {
    func addTransactionView(_ addTransactionView: AddTransactionViewController, didCreateTransaction newTransaction: Transaction)
}

class AddTransactionViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var typeButton: UIButton!
    
    var transactionType: String?
    var delegate: AddTransactionViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTypeButton()
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
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        // TODO: logica para agregar transaction
        guard let name = nameTextField.text, !name.isEmpty else { return }
        guard let amount = amountTextField.text, !amount.isEmpty else { return }
        guard let type = typeButton.titleLabel?.text else { return }
        
        let newTransaction = Transaction(id: "0ffd4eaa-09a1-4846-87b4-07a683fd2975", name: name, amount: 10.00, date: Date(), categoryId: "", type: type, description: "", images: [""])
                                         
        print(newTransaction.type)
        
        delegate?.addTransactionView(self, didCreateTransaction: newTransaction)
        
        dismiss(animated: true)
    }
    
    @IBAction func addFileTapped(_ sender: UIButton) {
    }
    
}
