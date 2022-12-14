//
//  AgregarPresupuestoViewController.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import UIKit

protocol AgregarPresupuestoViewControllerDelegate {
    func agregarPresupuestoView(_ viewController: AgregarPresupuestoViewController, didCreatePresupuesto presupuesto: Presupuesto)
}

class AgregarPresupuestoViewController: UIViewController {
    
    @IBOutlet weak var montoTextField: UITextField!
    @IBOutlet weak var categoriaButton: UIButton!
    
    var idCategoriaSeleccionada: String?
    
    let categorias = [
        Categoria(id: "Transporte", nombre: "Tranporte", tipo: "Gasto", icono: "icono.fill"),
        Categoria(id: "SueldoBase", nombre: "Sueldo Base", tipo: "Ingreso", icono: "sueldo.fill")
    ]
    
    var presupuesto: Presupuesto?
    
    var delegate: AgregarPresupuestoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Agregar presupuesto"
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
        let presupuesto = Presupuesto(id: "nuevoId", monto: "1000", categoria: "tranporte")
        delegate?.agregarPresupuestoView(self, didCreatePresupuesto: presupuesto)
        dismiss(animated: true)
    }
    
    @IBAction func didCancelTap(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
