//
//  DetalleCategoriaBuilder.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 16/12/22.
//

import UIKit

protocol DetalleCategoriaBuilderDelegate {
    func detalleCategoriaBuilder(didDeleteCategoria view: UIViewController)
}

class DetalleCategoriaBuilder {
    public var delegate: DetalleCategoriaBuilderDelegate?
    
    func build(detalle: CategoriaResponse) -> UIViewController {
        let router = DetalleCategoriaRouter(delegate: delegate!)
        
        let presenter = DetalleCategoriaPresenter(detalle: detalle)
        
        let api = FirebaseAPI()
        let interactor = DetalleCategoriaInteractor(presenter: presenter, api: api)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let view = storyboard.instantiateViewController(withIdentifier: "DetalleCategoriaViewController") as! DetalleCategoriaViewController
        view.presenter = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        router.view = view
        
        return view
    }
}
