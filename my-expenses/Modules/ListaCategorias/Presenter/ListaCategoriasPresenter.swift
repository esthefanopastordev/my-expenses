//
//  ListaCategoriaPresenter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import Foundation

protocol ListaCategoriasPresenterProtocol {
    func viewWillAppear()
    func listar(_ categorias: [CategoriaResponse])
}

class ListaCategoriasPresenter: ListaCategoriasPresenterProtocol {
    var view: ListaCategoriasViewProtocol?
    var interactor: ListaCategoriasInteractorProtocol?
    var router: ListaCategoriasRouterProtocol?
    
    func viewWillAppear() {
        interactor?.categorias()
    }
    
    func listar(_ categorias: [CategoriaResponse]) {
        view?.listar(categorias)
    }
}
