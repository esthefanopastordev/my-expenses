//
//  FormTransaccionPresenter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import Foundation

protocol FormTransaccionPresenterProtocol {
    func didDoneTap()
    func dismiss()
}

class FormTransaccionPresenter: FormTransaccionPresenterProtocol {
    var view: FormTransaccionViewProtocol?
    var interactor: FormTransaccionInteractorProtocol?
    var router: FormTransaccionRouterProtocol?
    
    func didDoneTap() {
        interactor?.add(NewTransaccion(descripcion: "Alguna medicina", cantidad: 3.50, tipo: "Gasto", fecha: "20221215T220641Z", categoriaId: "algunacategoria", nota: "algunanota"))
    }
    
    func dismiss() {
        router?.dismiss()
    }
}
