//
//  AgregarCategoriaViewController.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 13/12/22.
//

import UIKit

class AgregarCategoriaViewController: UIViewController {
    @IBOutlet weak var nombreTextField: UITextField?
    @IBOutlet weak var tipoButton: UIButton?
    @IBOutlet weak var iconoTextField: UITextField? // TODO: implementar dropdown de SF Symbols
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Agregar Categoría"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func didDoneTap(_ sender: UIBarButtonItem) {
        print("Done tapped")
        dismiss(animated: true)
    }
    
    @IBAction func didCancelTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
