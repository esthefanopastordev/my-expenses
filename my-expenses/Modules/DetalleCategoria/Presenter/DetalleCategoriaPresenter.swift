//
//  DetalleCategoriaPresenter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 16/12/22.
//

import Foundation

protocol DetalleCategoriaPresenterProtocol {
    func didDeleteTap()
    func dismiss()
}

class DetalleCategoriaPresenter {
    private var categoria: CategoriaResponse
    
    weak var view: DetalleCategoriaViewProtocol?
    var interactor: DetalleCategoriaInteractorProtocol?
    var router: DetalleCategoriaRouterProtocol?
    
    init(detalle: CategoriaResponse) {
        self.categoria = detalle
    }
}

extension DetalleCategoriaPresenter: DetalleCategoriaPresenterProtocol {
    func didDeleteTap() {
        guard let id = categoria.id else { return }
        interactor?.eliminarCategoria(por: id)
    }
    
    func dismiss() {
        router?.dismiss()
    }
}
