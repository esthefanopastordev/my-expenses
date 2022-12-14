//
//  CategoriasViewController.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 9/12/22.
//

import UIKit

class CategoriasViewController: UIViewController {
    
    @IBOutlet weak var categoriasTableView: UITableView?

    var categorias = [
        Categoria(id: "ABC", nombre: "Transporte", tipo: "gasto", icono: "hola"),
        Categoria(id: "DEF", nombre: "Sueldo base", tipo: "ingreso", icono: "hola")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriasTableView?.dataSource = self
        categoriasTableView?.delegate = self
        
        let ingreso = Tipo.ingreso
        print(ingreso)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "DetalleCategoriaSegue") {
            let indexPath = categoriasTableView?.indexPathForSelectedRow
            let categoriaSeleccionada = categorias[indexPath!.row]
            
            let nav = segue.destination as? UINavigationController
            let destination = nav?.viewControllers.first as? DetalleCategoriaViewController
            
            destination?.title = categoriaSeleccionada.nombre
            destination?.setCategoria(categoria: categoriaSeleccionada)
            destination?.delegate = self
        }
    }

}

extension CategoriasViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Tipo.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return Tipo.gasto.rawValue
        }
        if (section == 1) {
            return Tipo.ingreso.rawValue
        }
        
        return ""
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as? CategoriaTableViewCell else { return UITableViewCell() }
        
        let categoria = categorias[indexPath.row]
        
        cell.nombreLabel?.text = categoria.nombre
        cell.montoTotalLabel?.text = "$300"
        cell.numeroDeItemsLabel?.text = "3 items"
        cell.iconoImageView?.tintColor = "Gasto" == "Gasto" ? UIColor.systemRed : UIColor.systemGreen
        
        return cell
    }
    
}

extension CategoriasViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CategoriasViewController: DetalleCategoriaViewControllerDelegate {
    func detalleCategoriaView(_ viewController: DetalleCategoriaViewController, didRemoveCategory categoryId: String) {
        categorias = categorias.filter({ $0.id != categoryId })
        categoriasTableView?.reloadData()
    }
}
