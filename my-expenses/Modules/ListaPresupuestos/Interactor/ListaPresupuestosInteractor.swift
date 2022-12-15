//
//  ListaPresupuestosInteractor.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import Foundation

protocol ListaPresupuestosInteractorProtocol {
    func presupuestos()
}

class ListaPresupuestosInteractor: ListaPresupuestosInteractorProtocol {
    var presenter: ListaPresupuestosPresenterProtocol?
    var api: RemoteRepository?
    
    required init(presenter: ListaPresupuestosPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
    
    @MainActor
    func presupuestos() {
        print("Hola PresupuestoInteractor")
        Task.init {
            guard let presupuestos = try await api?.fetchPresupuestos() else { return }
            presenter?.listar(presupuestos)
        }
    }
}
