//
//  ListaPresupuestosViewController.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import UIKit

class ListaPresupuestosViewController: UIViewController {
    
    @IBOutlet weak var presupuestosTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        presupuestosTableView.dataSource = self
        presupuestosTableView.delegate = self
    }
    
}

extension ListaPresupuestosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "presupuestoCell", for: indexPath)
        return cell
    }
    
    
}

extension ListaPresupuestosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
