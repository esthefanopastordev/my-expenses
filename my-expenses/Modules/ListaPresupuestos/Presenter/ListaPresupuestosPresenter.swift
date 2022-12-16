//
//  ListaPresupuestosPresenter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import Foundation

protocol ListaPresupuestosPresenterProtocol {
    func viewWillAppear()
    func listar(_ presupuestos: [PresupuestoResponse])
    func presentarForm()
}

class ListaPresupuestosPresenter {
    var view: ListaPresupuestosViewProtocol?
    var interactor: ListaPresupuestosInteractorProtocol?
    var router: ListaPresupuestosRouterProtocol?
}

extension ListaPresupuestosPresenter: ListaPresupuestosPresenterProtocol {
    func viewWillAppear() {
        interactor?.presupuestos()
    }
    
    func listar(_ presupuestos: [PresupuestoResponse]) {
        view?.listar(presupuestos)
    }
    
    func presentarForm() {
        router?.mostrarForm()
    }
}
