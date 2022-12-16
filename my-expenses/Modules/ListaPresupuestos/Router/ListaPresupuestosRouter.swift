//
//  ListaPresupuestosRouter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import UIKit

protocol ListaPresupuestosRouterProtocol {
    func mostrarForm()
}

class ListaPresupuestosRouter {
    var view: UIViewController?
    
    private var formPresupuestoBuilder: FormPresupuestoBuilder?
    
}

extension ListaPresupuestosRouter: ListaPresupuestosRouterProtocol {
    func mostrarForm() {
        formPresupuestoBuilder = FormPresupuestoBuilder()
        
        let formPresupuestoViewController = formPresupuestoBuilder!.build()
        view?.present(formPresupuestoViewController, animated: true)
    }
}
