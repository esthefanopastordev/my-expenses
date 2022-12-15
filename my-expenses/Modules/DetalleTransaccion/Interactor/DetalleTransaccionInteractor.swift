//
//  DetalleTransaccionInteractor.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import Foundation

protocol DetalleTransaccionInteractorProtocol {
    func eliminar(por id: String)
}

class DetalleTransaccionInteractor: DetalleTransaccionInteractorProtocol {
    var presenter: DetalleTransaccionPresenterProtocol?
    var api: RemoteRepository?
    
    required init (presenter: DetalleTransaccionPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
    
    @MainActor
    func eliminar(por id: String) {
        Task.init {
            try await api?.deleteTransaccion(por: id)
            presenter?.dismiss()
        }
    }
}
