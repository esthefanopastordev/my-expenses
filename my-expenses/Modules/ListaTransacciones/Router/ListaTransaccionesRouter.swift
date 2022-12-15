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
    var formTransaccionBuilder: FormTransaccionBuilder?
    
    func mostrar(_ transaccion: TransaccionResponse) {
        detalleTransaccionBuilder = DetalleTransaccionBuilder()
        detalleTransaccionBuilder?.delegate = self
        
        let detalleTransaccionViewController = detalleTransaccionBuilder!.build(transaccion)
        view?.show(detalleTransaccionViewController, sender: nil)
    }
    
    func mostrarForm() {
        formTransaccionBuilder = FormTransaccionBuilder()
        formTransaccionBuilder?.delegate = self
        
        let formTransaccionViewController = formTransaccionBuilder!.build()
        view?.show(formTransaccionViewController, sender: nil)
    }
}

extension ListaTransaccionesRouter: DetalleTransaccionBuilderDelegate {
    func detalleTransaccionBuilder(didDelete viewController: UIViewController) {
        presenter?.recargar()
    }
}

extension ListaTransaccionesRouter: FormTransaccionBuilderDelegate {
    func formTransaccionBuilder(didCreate viewController: UIViewController) {
        print("Me cree asies")
        presenter?.recargar()
    }
}
