//
//  ListaCategoriasRouter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import UIKit

protocol ListaCategoriasRouterProtocol {
    func mostrar(_ categoria: CategoriaResponse)
    func mostrarForm()
}

class ListaCategoriasRouter {
    var presenter: ListaCategoriasPresenterProtocol?
    var view: UIViewController?
    
    private var detalleCategoriaBuilder: DetalleCategoriaBuilder?
    private var formCategoriaBuilder: FormCategoriaBuilder?
}

extension ListaCategoriasRouter: ListaCategoriasRouterProtocol {
    func mostrar(_ categoria: CategoriaResponse) {
        detalleCategoriaBuilder = DetalleCategoriaBuilder()
        detalleCategoriaBuilder?.delegate = self
        
        let detalleCategoriaViewController = detalleCategoriaBuilder!.build(detalle: categoria)
        view?.show(detalleCategoriaViewController, sender: nil)
    }
    
    func mostrarForm() {
        formCategoriaBuilder = FormCategoriaBuilder()
    
        let formCategoriaViewController = formCategoriaBuilder!.build()
        view?.show(formCategoriaViewController, sender: nil)
    }
}

extension ListaCategoriasRouter: DetalleCategoriaBuilderDelegate {
    func detalleCategoriaBuilder(didDeleteCategoria view: UIViewController) {
        print("Algo pasó")
    }
}
