//
//  CategoriasViewController.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 9/12/22.
//

import UIKit

class CategoriasViewController: UIViewController {
    
    @IBOutlet weak var categoriasTableView: UITableView?
    
    let tipos = [
        Tipo(id: "ABC", name: "Gasto"),
        Tipo(id: "DEF", name: "Ingreso")
    ]
    
    let categorias = [
        Categoria(id: "ABC", nombre: "Transporte", tipo: "ABC", icono: "hola"),
        Categoria(id: "DEF", nombre: "Sueldo base", tipo: "DEF", icono: "hola")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriasTableView?.dataSource = self
        categoriasTableView?.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "DetalleCategoriaSegue") {
            let indexPath = categoriasTableView?.indexPathForSelectedRow
            let categoriaSeleccionada = categorias[indexPath!.row]
            
            let nav = segue.destination as? UINavigationController
            
            let destination = nav?.viewControllers.first as? DetalleCategoriaViewController
            
            destination?.title = categoriaSeleccionada.nombre
            
        }
    }

}

extension CategoriasViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tipos.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tipos[section].name
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as? CategoriaTableViewCell else { return UITableViewCell() }
        
        let categoria = categorias[indexPath.row]
        let tipo = tipos.first(where: { $0.id == categoria.tipo })
        
        cell.nombreLabel?.text = categoria.nombre
        cell.montoTotalLabel?.text = "$300"
        cell.numeroDeItemsLabel?.text = "3 items"
        cell.iconoImageView?.tintColor = tipo?.name == "Gasto" ? UIColor.systemRed : UIColor.systemGreen
        
        return cell
    }
    
}

extension CategoriasViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
