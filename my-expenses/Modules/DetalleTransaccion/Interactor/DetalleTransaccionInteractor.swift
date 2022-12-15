//
//  DetalleTransaccionInteractor.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import Foundation

protocol DetalleTransaccionInteractorProtocol {
    func eliminar(by transaccionId: String)
}

class DetalleTransaccionInteractor: DetalleTransaccionInteractorProtocol {
    var presenter: DetalleTransaccionPresenterProtocol?
    var api: RemoteRepository?
    
    required init (presenter: DetalleTransaccionPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
    
    func eliminar(by transaccionId: String) {
        // TODO: call API
        presenter?.dismiss()
    }
}
