//
//  HomeViewController.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 4/12/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var transactionsTableView: UITableView!
    
    var transactionsMocked = [
        Transaction(name: "Burger", amount: 17, date: Date(), categoryId: "ABC", type: "gasto", description: "", images: [""]),
        Transaction(name: "Shoes", amount: 199.99, date: Date(), categoryId: "DEF", type: "gasto", description: "Nice shoes", images: [""]),
        Transaction(name: "Dress", amount: 80, date: Date(), categoryId: "GHI", type: "gasto", description: "", images: [""]),
        Transaction(name: "Sueldo", amount: 2500, date: Date(), categoryId: "JKL", type: "ingreso", description: "", images: [""])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionsTableView.dataSource = self
        transactionsTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as? UINavigationController
        
        if (segue.identifier == "TransactionDetailsSegue") {
            guard let destination = nav?.viewControllers.first as? TransactionDetailsViewController else { return }
            guard let selectedRow = transactionsTableView.indexPathForSelectedRow?.row else { return }
            
            let transaction = transactionsMocked[selectedRow]
            destination.transaction = transaction
        } else if (segue.identifier == "AddTransactionSegue") {
            guard let destination = nav?.viewControllers.first as? AddTransactionViewController else { return }
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
        
        let transaction = transactionsMocked[indexPath.row]
        let amountPrefix = transaction.type == "gasto" ? "-$" : "$"
        
        cell.nameLabel.text = transaction.name
        cell.montoLabel.text = amountPrefix + String(transaction.amount)
        cell.montoLabel.textColor = transaction.type == "gasto" ? UIColor.systemRed : UIColor.systemGreen
        cell.categoryIconImageView.tintColor = transaction.type == "gasto" ? UIColor.systemRed : UIColor.systemGreen
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: AddTransactionViewControllerDelegate {
    func addTransactionView(_ addTransactionView: AddTransactionViewController, didCreateTransaction newTransaction: Transaction) {
        transactionsMocked.append(newTransaction)
        transactionsTableView.reloadData()
    }
}
