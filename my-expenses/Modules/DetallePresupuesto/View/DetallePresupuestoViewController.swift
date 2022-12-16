//
//  DetallePresupuestoViewController.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 16/12/22.
//

import UIKit

protocol DetallePresupuestoViewProtocol {
    
}

class DetallePresupuestoViewController: UIViewController {
    var presenter: DetallePresupuestoPresenterProtocol?
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.shadowImage = UIImage()
    }
    
    @IBAction func didTrashTap() {
        
    }
}

extension DetallePresupuestoViewController: DetallePresupuestoViewProtocol {
    
}
