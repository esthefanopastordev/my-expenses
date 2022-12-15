//
//  ListaTransaccionesPresenter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import Foundation

protocol ListaTransaccionesPresenterProtocol {
    func viewWillApper()
    func listar(_ transacciones: [TransaccionResponse])
}

class ListaTransaccionesPresenter: ListaTransaccionesPresenterProtocol {
    weak var view: ListaTransaccionesViewProtocol?
    var interactor: ListaTransaccionesInteractorProtocol?
    var router: ListaTransaccionesRouterProtocol?
    
    func viewWillApper() {
        interactor?.transacciones()
    }
    
    func listar(_ transacciones: [TransaccionResponse]) {
        view?.listar(transacciones)
    }
}
