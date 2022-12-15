//
//  ListaTransaccionesInteractor.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import Foundation

protocol ListaTransaccionesInteractorProtocol {
    func transacciones()
}

class ListaTransaccionesInteractor: ListaTransaccionesInteractorProtocol {
    var presenter: ListaTransaccionesPresenterProtocol?
    
    var api: RemoteRepository?
    
    required init(presenter: ListaTransaccionesPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
    
    @MainActor
    func transacciones() {
        print("Hola Interactor")
        Task.init {
            guard let transacciones = try await api?.fetchTransacciones() else { return }
            presenter?.listar(transacciones)
        }
    }
}
