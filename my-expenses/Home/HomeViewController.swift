//
//  HomeViewController.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 4/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var ingresosTotalesLabel: UILabel!
    @IBOutlet weak var gastosTotales: UILabel!
    @IBOutlet weak var transactionsTableView: UITableView!
    
    var transactionsMocked = [
        Transaccion(id: "b5615569-a59a-4d39-bcd9-fe4601997cda", nombre: "Burger", cantidad: 17, fecha: "2022-12-14T21:44:12Z", categoriaId: "ABC", tipo: "gasto", descripcion: ""),
        Transaccion(id: "1f7dcd58-153a-4079-876d-f4efc4eb72f7", nombre: "Shoes", cantidad: 199.99, fecha: "2022-12-14T21:44:12Z", categoriaId: "DEF", tipo: "gasto", descripcion: "Nice shoes"),
        Transaccion(id: "f3652ca5-446f-4d37-9ad7-9fcfdb3d3be4", nombre: "Dress", cantidad: 80, fecha: "2022-12-14T21:44:12Z", categoriaId: "GHI", tipo: "gasto", descripcion: ""),
        Transaccion(id: "56706c62-9047-4819-81a9-89ed14e3649e", nombre: "Sueldo", cantidad: 2500, fecha: "2022-12-14T21:44:12Z", categoriaId: "JKL", tipo: "ingreso", descripcion: "")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionsTableView.dataSource = self
        transactionsTableView.delegate = self
        
        setupLabels()
        
        let current = Date()
        
        let newFormatter = ISO8601DateFormatter()
        
        let stringDate = newFormatter.string(from: current)
        let dateDate = newFormatter.date(from: stringDate)
        
//        let date = newFormatter.date(from: "2022-01-31T02:22:40Z")
        
        

        print("Fecha actual \(stringDate)")
        print("Fecha actual Fecha no format \(current)")
        print("Fecha actual Fecha \(dateDate)")
    }
    
    func setupLabels() {
        let gastos = transactionsMocked.filter{ $0.tipo == "gasto" }
        let ingresos = transactionsMocked.filter{ $0.tipo == "ingreso" }
        var totalIngresos = 0.00
        var totalGastos = 0.00
        
        for ingreso in ingresos {
            totalIngresos += ingreso.cantidad
        }
        
        for gasto in gastos {
            totalGastos += gasto.cantidad
        }
        
        let balanceTotal = totalIngresos - totalGastos
        
        balanceLabel.text = "$\(String(balanceTotal))"
        ingresosTotalesLabel.text = "$\(String(totalIngresos))"
        gastosTotales.text = "$\(String(totalGastos))"
    }
    
    @IBAction func didAddTap(_ sender: UIBarButtonItem) {
        let destinationVC = storyboard?.instantiateViewController(withIdentifier: "FormTransaccionViewController") as! FormTransaccionViewController
        destinationVC.delegate = self
        present(destinationVC, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as? UINavigationController
        
        if (segue.identifier == "TransactionDetailsSegue") {
            guard let destination = nav?.viewControllers.first as? TransactionDetailsViewController else { return }
            guard let selectedRow = transactionsTableView.indexPathForSelectedRow?.row else { return }
            
            let transaction = transactionsMocked[selectedRow]
            destination.transaction = transaction
            destination.delegate = self
        }
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionsMocked.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionTableViewCell") as? TransactionTableViewCell else { return UITableViewCell() }
        
        let transaccion = transactionsMocked[indexPath.row]
        let amountPrefix = transaccion.tipo == "gasto" ? "-$" : "$"
        
        cell.nameLabel.text = transaccion.nombre
        cell.montoLabel.text = amountPrefix + String(transaccion.cantidad)
        cell.montoLabel.textColor = transaccion.tipo == "gasto" ? UIColor.systemRed : UIColor.systemGreen
        cell.categoryIconImageView.tintColor = transaccion.tipo == "gasto" ? UIColor.systemRed : UIColor.systemGreen
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: FormTransaccionViewDelegate {
    func formTransaccionView(_ formTransaccionView: FormTransaccionViewController, didCreateTransaction transaccion: Transaccion) {
        transactionsMocked.append(transaccion)
        transactionsTableView.reloadData()
        setupLabels()
    }
}

extension HomeViewController: TransactionDetailsViewControllerDelegate {
    func transactionDetailsView(_ transactionDetailsView: TransactionDetailsViewController, didRemoveTransaction transactionId: String) {
        transactionsMocked = transactionsMocked.filter{ $0.id != transactionId }
        transactionsTableView.reloadData()
        setupLabels()
    }
}
