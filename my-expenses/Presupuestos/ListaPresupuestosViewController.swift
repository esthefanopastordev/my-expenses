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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "agregarPresupuestoSegue") {
            let nav = segue.destination as? UINavigationController
            let destination = nav?.viewControllers.first as? AgregarPresupuestoViewController
            destination?.delegate = self
        }
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

extension ListaPresupuestosViewController: AgregarPresupuestoViewControllerDelegate {
    func agregarPresupuestoView(_ viewController: AgregarPresupuestoViewController, didCreatePresupuesto presupuesto: Presupuesto) {
        print("Did create presupuesto")
    }
}
