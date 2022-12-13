//
//  DetalleCategoriaViewController.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 12/12/22.
//

import UIKit

protocol DetalleCategoriaViewControllerDelegate {
    func detalleCategoriaView(_ viewController: DetalleCategoriaViewController, didRemoveCategory categoryId: String)
}

class DetalleCategoriaViewController: UIViewController {
    private var categoria: Categoria?
    var delegate: DetalleCategoriaViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setCategoria(categoria: Categoria) {
        self.categoria = categoria
    }

    @IBAction func didDeleteTap(_ sender: UIBarButtonItem) {
        delegate?.detalleCategoriaView(self, didRemoveCategory: categoria!.id)
        dismiss(animated: true)
    }
}
