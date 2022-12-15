//
//  DetalleTransaccionPresenter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import Foundation

protocol DetalleTransaccionPresenterProtocol {
    func getDetalle() -> TransaccionResponse
    func eliminarTransaccion()
    func dismiss()
}

class DetalleTransaccionPresenter: DetalleTransaccionPresenterProtocol {
    private var detalle: TransaccionResponse
    
    var view: DetalleTransaccionViewProtocol?
    var interactor: DetalleTransaccionInteractorProtocol?
    var router: DetalleTransaccionRouterProtocol?
    
    required init(detalle: TransaccionResponse) {
        self.detalle = detalle
    }
    
    func getDetalle() -> TransaccionResponse {
        return detalle
    }
    
    func eliminarTransaccion() {
        interactor?.eliminar(by: detalle.descripcion)
    }
    
    func dismiss() {
        router?.dismiss()
    }
}
