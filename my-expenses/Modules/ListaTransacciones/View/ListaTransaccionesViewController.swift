//
//  HomeViewController.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 4/12/22.
//

import UIKit
import FirebaseFirestore

class ListaTransaccionesViewController: UIViewController {
    var presenter: ListaTransaccionesPresenterInputProtocol?
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var ingresosTotalesLabel: UILabel!
    @IBOutlet weak var gastosTotales: UILabel!
    @IBOutlet weak var transactionsTableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter?.viewWillApper()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transactionsTableView.dataSource = self
        transactionsTableView.delegate = self
        navigationBar.shadowImage = UIImage() // Remove default navigation bar shadow
    }
    
    @IBAction func didAddTap(_ sender: UIBarButtonItem) {
        presenter?.presentarForm()
    }
}

extension ListaTransaccionesViewController: ListaTransaccionesViewProtocol {
    func showTransacciones() {
        updateUI()
    }
}

extension ListaTransaccionesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numeroDeTransacciones ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell") as? TransaccionTableViewCell else { return UITableViewCell() }
        let transaccion = presenter?.transaccion(for: indexPath.row)
        cell.setUp(transaccion!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ListaTransaccionesViewController {
    func updateUI() {
        transactionsTableView.reloadData()
        ingresosTotalesLabel.text = "$\(presenter!.ingresosTotales)"
        gastosTotales.text = "$\(presenter!.gastosTotales)"
        balanceLabel.text = "$\(presenter!.balanceTotal)"
    }
}
