//
//  ListaTransaccionesRouter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import Foundation
import UIKit

protocol ListaTransaccionesRouterProtocol {
    func mostrar(_ transaccion: TransaccionResponse)
    func mostrarForm()
}

class ListaTransaccionesRouter: ListaTransaccionesRouterProtocol {
    var presenter: ListaTransaccionesPresenterProtocol?
    var view: UIViewController?
    
    var detalleTransaccionBuilder: DetalleTransaccionBuilder?
    
    func mostrar(_ transaccion: TransaccionResponse) {
        detalleTransaccionBuilder = DetalleTransaccionBuilder()
        detalleTransaccionBuilder?.delegate = self
        
        let detalleTransaccionViewController = detalleTransaccionBuilder!.build(transaccion)
        view?.show(detalleTransaccionViewController, sender: nil)
    }
    
    func mostrarForm() {
        let vc = FormTransaccionBuilder.build()
        view?.show(vc, sender: nil)
    }
}

extension ListaTransaccionesRouter: DetalleTransaccionBuilderDelegate {
    func detalleTransaccionBuilder(didDelete viewController: UIViewController) {
        presenter?.recargar()
    }
}
