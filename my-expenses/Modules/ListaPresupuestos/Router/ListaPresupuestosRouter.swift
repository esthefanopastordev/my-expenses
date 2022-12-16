//
//  ListaPresupuestosRouter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import UIKit

protocol ListaPresupuestosRouterProtocol {
    func mostrarDetalle(_ presupuesto: Presupuesto)
    func mostrarForm()
}

class ListaPresupuestosRouter {
    var view: UIViewController?
    
    private var detallePresupuestoBuilder: DetallePresupuestoBuilder?
    private var formPresupuestoBuilder: FormPresupuestoBuilder?
}

extension ListaPresupuestosRouter: ListaPresupuestosRouterProtocol {
    func mostrarDetalle(_ presupuesto: Presupuesto) {
        detallePresupuestoBuilder = DetallePresupuestoBuilder()
        
        let detallePresupuestoViewController = detallePresupuestoBuilder!.build()
        view?.present(detallePresupuestoViewController, animated: true)
    }
    
    func mostrarForm() {
        formPresupuestoBuilder = FormPresupuestoBuilder()
        
        let formPresupuestoViewController = formPresupuestoBuilder!.build()
        view?.present(formPresupuestoViewController, animated: true)
    }
}
