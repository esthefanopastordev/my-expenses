//
//  AgregarCategoriaViewController.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 13/12/22.
//

import UIKit

protocol AgregarCategoriaViewDelegate {
    func agregarCategoriaView(_ agregarCategoriaViewController: AgregarCategoriaViewController, didCreateCategory categoria: Categoria)
}

class AgregarCategoriaViewController: UIViewController {
    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var tipoButton: UIButton!
    @IBOutlet weak var iconoTextField: UITextField! // TODO: implementar dropdown de SF Symbols

    var delegate: AgregarCategoriaViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Agregar Categoría"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func didDoneTap(_ sender: UIBarButtonItem) {
        guard let nombre = nombreTextField.text, !nombre.isEmpty else { return }
        let tipo = "Ingreso"
        guard let icono = iconoTextField.text, !icono.isEmpty else { return }
        
        let categoria = Categoria(id: "Hola", nombre: nombre, tipo: tipo, icono: icono)
        
        delegate?.agregarCategoriaView(self, didCreateCategory: categoria)
        dismiss(animated: true)
    }
    
    @IBAction func didCancelTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
