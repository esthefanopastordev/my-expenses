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
    
    func mostrar(_ transaccion: TransaccionResponse) {
        let vc = DetalleTransaccionBuilder.build(transaccion)
        view?.show(vc, sender: nil)
    }
    
    func mostrarForm() {
        let vc = FormTransaccionBuilder.build()
        view?.show(vc, sender: nil)
    }
}
