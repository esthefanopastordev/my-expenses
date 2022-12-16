//
//  CategoriasViewController.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 9/12/22.
//

import UIKit

protocol ListaCategoriasViewProtocol {
    func listar(_ categorias: [CategoriaResponse])
}

class ListaCategoriasViewController: UIViewController {
    
    private var categorias: [CategoriaResponse] = []
    // TODO: buscar forma de implementar esto
    private var categorisUpdate: [String: [CategoriaResponse]] = [:]
    
    @IBOutlet weak var categoriasTableView: UITableView?
    
    var presenter: ListaCategoriasPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoriasTableView?.dataSource = self
        categoriasTableView?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter?.viewWillAppear()
    }
}

extension ListaCategoriasViewController: ListaCategoriasViewProtocol {
    func listar(_ categorias: [CategoriaResponse]) {
        self.categorias = categorias
        // TODO: mover la lógica a otro lado
        for tipoCategoria in Tipo.allCases {
            categorisUpdate[tipoCategoria.rawValue] = categorias.filter { $0.tipo == tipoCategoria.rawValue }
        }
        categoriasTableView?.reloadData()
    }
}

extension ListaCategoriasViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Tipo.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Tipo.allCases[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tipoCategoria = Tipo.allCases[section].rawValue
        return categorisUpdate[tipoCategoria]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as? CategoriaTableViewCell else { return UITableViewCell() }
        
        let tipoCategoria = Tipo.allCases[indexPath.section].rawValue
        let categoria = categorisUpdate[tipoCategoria]![indexPath.row]
        
        let category = Categoria(id: categoria.id ?? "", nombre: categoria.nombre, tipo: categoria.tipo, icono: categoria.icono)
        
        cell.setUp(from: category)
        
        return cell
    }
}

extension ListaCategoriasViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
