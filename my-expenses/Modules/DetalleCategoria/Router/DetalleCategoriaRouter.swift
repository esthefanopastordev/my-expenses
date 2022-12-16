//
//  DetalleCategoriaRouter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 16/12/22.
//

import UIKit

protocol DetalleCategoriaRouterProtocol {
    func dismiss()
}

class DetalleCategoriaRouter {
    var view: UIViewController?
    var delegate: DetalleCategoriaBuilderDelegate
    
    required init(delegate: DetalleCategoriaBuilderDelegate) {
        self.delegate = delegate
    }
}

extension DetalleCategoriaRouter: DetalleCategoriaRouterProtocol {
    func dismiss() {
        view?.dismiss(animated: true)
        delegate.detalleCategoriaBuilder(didDeleteCategoria: view!)
    }
}
