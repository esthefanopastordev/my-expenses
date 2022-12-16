//
//  AgregarCategoriaViewController.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 13/12/22.
//

import UIKit

protocol FormCategoriaViewProtocol {
    
}

class FormCategoriaViewController: UIViewController {
    var presenter: FormCategoriaPresenterProtocol?
    
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var tipoButton: UIButton!
    @IBOutlet weak var iconoTextField: UITextField! // TODO: implementar dropdown de SF Symbols
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didDoneTap(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func didCancelTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

extension FormCategoriaViewController: FormCategoriaViewProtocol {
    
}
