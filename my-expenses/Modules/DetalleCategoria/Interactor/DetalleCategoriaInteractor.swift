//
//  DetalleCategoriaInteractor.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 16/12/22.
//

import Foundation

protocol DetalleCategoriaInteractorProtocol {
    func eliminarCategoria(por id: String)
}

class DetalleCategoriaInteractor {
    var presenter: DetalleCategoriaPresenterProtocol
    var api: RemoteRepository
    
    required init(presenter: DetalleCategoriaPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
}

extension DetalleCategoriaInteractor: DetalleCategoriaInteractorProtocol {
    func eliminarCategoria(por id: String) {
        // TODO: call api
        presenter.dismiss()
    }
}
