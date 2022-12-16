//
//  ListaCategoriasRouter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import UIKit

protocol ListaCategoriasRouterProtocol {
    func mostrar(_ categoria: CategoriaResponse)
}

class ListaCategoriasRouter {
    var presenter: ListaCategoriasPresenterProtocol?
    var view: UIViewController?
    
    private var detalleCategoriaBuilder: DetalleCategoriaBuilder?
}

extension ListaCategoriasRouter: ListaCategoriasRouterProtocol {
    func mostrar(_ categoria: CategoriaResponse) {
        detalleCategoriaBuilder = DetalleCategoriaBuilder()
        detalleCategoriaBuilder?.delegate = self
        
        let detalleCategoriaViewController = detalleCategoriaBuilder!.build(detalle: categoria)
        view?.show(detalleCategoriaViewController, sender: nil)
    }
}

extension ListaCategoriasRouter: DetalleCategoriaBuilderDelegate {
    func detalleCategoriaBuilder(didDeleteCategoria view: UIViewController) {
        print("Algo pasó")
    }
}
