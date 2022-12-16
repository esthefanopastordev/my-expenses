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
    func presentarDetalle(_ categoria: CategoriaResponse)
    func presenterForm()
}

class ListaCategoriasPresenter {
    var view: ListaCategoriasViewProtocol?
    var interactor: ListaCategoriasInteractorProtocol?
    var router: ListaCategoriasRouterProtocol?
}

extension ListaCategoriasPresenter: ListaCategoriasPresenterProtocol {
    func viewWillAppear() {
        interactor?.categorias()
    }
    
    func listar(_ categorias: [CategoriaResponse]) {
        view?.listar(categorias)
    }
    
    func presentarDetalle(_ categoria: CategoriaResponse) {
        router?.mostrar(categoria)
    }
    
    func presenterForm() {
        router?.mostrarForm()
    }
}
