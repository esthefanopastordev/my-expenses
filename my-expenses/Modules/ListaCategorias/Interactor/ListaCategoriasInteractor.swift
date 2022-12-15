//
//  ListaCategoriaInteractor.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import Foundation

protocol ListaCategoriasInteractorProtocol {
    func categorias()
}

class ListaCategoriasInteractor: ListaCategoriasInteractorProtocol {
    var presenter: ListaCategoriasPresenterProtocol?
    var api: RemoteRepository?
    
    required init(presenter: ListaCategoriasPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
    
    @MainActor
    func categorias() {
        print("Hola CategoriasInteractor")
        Task.init {
            guard let categorias = try await api?.fetchCategorias() else { return }
            presenter?.listar(categorias)
        }
    }
}
