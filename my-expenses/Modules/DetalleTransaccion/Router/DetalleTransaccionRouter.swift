//
//  DetalleTransaccionesRouter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import UIKit

protocol DetalleTransaccionRouterProtocol {
    func dismiss()
}

class DetalleTransaccionRouter: DetalleTransaccionRouterProtocol {
    var view: UIViewController?
    var delegate: DetalleTransaccionBuilderDelegate
    
    required init(delegate: DetalleTransaccionBuilderDelegate) {
        self.delegate = delegate
    }
    
    func dismiss() {
        view?.dismiss(animated: true)
        delegate.detalleTransaccionBuilder(didDelete: view!)
    }
}
