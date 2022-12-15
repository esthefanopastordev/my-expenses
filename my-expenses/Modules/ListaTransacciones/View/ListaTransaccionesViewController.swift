//
//  HomeViewController.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 4/12/22.
//

import UIKit
import FirebaseFirestore

protocol ListaTransaccionesViewProtocol: AnyObject {
    func listar(_ transacciones: [TransaccionResponse])
}

class ListaTransaccionesViewController: UIViewController {
    private var transacciones: [TransaccionResponse] = []
    
    var presenter: ListaTransaccionesPresenterProtocol?
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var ingresosTotalesLabel: UILabel!
    @IBOutlet weak var gastosTotales: UILabel!
    @IBOutlet weak var transactionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionsTableView.dataSource = self
        transactionsTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillApper()
    }
    
    @IBAction func didAddTap(_ sender: UIBarButtonItem) {
    }
}

extension ListaTransaccionesViewController: ListaTransaccionesViewProtocol {
    func listar(_ transacciones: [TransaccionResponse]) {
        self.transacciones = transacciones
        transactionsTableView.reloadData()
    }
}

extension ListaTransaccionesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transacciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell") as? TransaccionTableViewCell else { return UITableViewCell() }
        let transaccion = transacciones[indexPath.row]
        // TODO: cast transaction
        let a = Transaccion(id: transaccion.id ?? "", nombre: transaccion.descripcion, cantidad: transaccion.cantidad, fecha: transaccion.fecha, categoriaId: transaccion.categoriaId, tipo: transaccion.tipo, descripcion: transaccion.nota)
        cell.setUp(transaccion: a)
        return cell
    }
}

extension ListaTransaccionesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transaccion = transacciones[indexPath.row]
        presenter?.presentarDetalle(transaccion)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
