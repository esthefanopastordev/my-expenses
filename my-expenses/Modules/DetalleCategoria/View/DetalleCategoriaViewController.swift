//
//  DetalleCategoriaViewController.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 12/12/22.
//

import UIKit

protocol DetalleCategoriaViewProtocol: AnyObject {
    
}

class DetalleCategoriaViewController: UIViewController {
    var presenter: DetalleCategoriaPresenterProtocol?
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.prefersLargeTitles = true
        navigationBar.shadowImage = UIImage()
    }

    @IBAction func didDeleteTap(_ sender: UIBarButtonItem) {
        presenter?.didDeleteTap()
    }
}

extension DetalleCategoriaViewController: DetalleCategoriaViewProtocol {
    
}
