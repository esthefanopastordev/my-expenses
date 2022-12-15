//
//  DetalleTransaccionBuilder.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import Foundation
import UIKit

public protocol DetalleTransaccionBuilderDelegate {
    func detalleTransaccionBuilder(didDelete viewController: UIViewController)
}

class DetalleTransaccionBuilder {
    public var delegate: DetalleTransaccionBuilderDelegate?
    
    func build(_ detalle: TransaccionResponse) -> UIViewController {
        let router = DetalleTransaccionRouter(delegate: delegate!)
        print(detalle.descripcion)
        let presenter = DetalleTransaccionPresenter(detalle: detalle)
        
        let api = FirebaseAPI()
        let interactor = DetalleTransaccionInteractor(presenter: presenter, api: api)
        
        let storybard = UIStoryboard(name: "Main", bundle: nil)
        
        let view = storybard.instantiateViewController(withIdentifier: "DetalleTransaccionViewController") as! DetalleTransaccionViewController
        view.presenter = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view

        router.view = view
        
        return view
    }
}
