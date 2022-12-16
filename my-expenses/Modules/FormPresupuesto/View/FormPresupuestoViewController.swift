//
//  FormPresupuestoViewController.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 16/12/22.
//

import UIKit

protocol FormPresupuestoViewProtocol {
    
}

class FormPresupuestoViewController: UIViewController {
    @IBOutlet weak var montoTextField: UITextField!
    @IBOutlet weak var categoriaButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    var idCategoriaSeleccionada: String?
    
    let categorias = [
        Categoria(id: "Transporte", nombre: "Tranporte", tipo: "Gasto", icono: "icono.fill"),
        Categoria(id: "SueldoBase", nombre: "Sueldo Base", tipo: "Ingreso", icono: "sueldo.fill")
    ]
    
    var presupuesto: Presupuesto?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCategoriaPopUpButton()
    }
    
    func setUpCategoriaPopUpButton() {
        let optionClosure = { (action: UIAction) in self.idCategoriaSeleccionada = action.title }
        
        categoriaButton.menu = UIMenu(children : [
            UIAction(title: categorias[0].nombre, state: .on, handler: optionClosure),
            UIAction(title: categorias[1].nombre, handler: optionClosure),
        ])
        categoriaButton.showsMenuAsPrimaryAction = true
        categoriaButton.changesSelectionAsPrimaryAction = true
    }
    
    @IBAction func didDoneTap(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func didCancelTap(_ sender: UIBarButtonItem) {
        
    }
}

extension FormPresupuestoViewController: FormPresupuestoViewProtocol {
    
}
