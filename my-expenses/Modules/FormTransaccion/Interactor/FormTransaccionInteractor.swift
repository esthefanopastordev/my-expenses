//
//  FormTransaccionInteractor.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import Foundation

protocol FormTransaccionInteractorProtocol {
    func add(_ transaccion: NewTransaccion)
}

class FormTransaccionInteractor: FormTransaccionInteractorProtocol {
    var presenter: FormTransaccionPresenterProtocol?
    var api: RemoteRepository?
    
    required init(presenter: FormTransaccionPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
    
    @MainActor
    func add(_ transaccion: NewTransaccion) {
        Task.init {
            try await api?.add(transaccion)
            presenter?.dismiss()
        }
    }
}

struct NewTransaccion: Encodable {
    let descripcion: String
    let cantidad: Double
    let tipo: String
    let fecha: String
    let categoriaId: String
    let nota: String
}
