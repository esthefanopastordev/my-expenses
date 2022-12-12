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
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = categorias[indexPath.row].nombre
        
        return cell
    }
    
    
}
