//
//  ListaPresupuestosBuilder.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import Foundation
import UIKit

class ListaPresupuestosBuilder {
    static func build() -> UIViewController {
        let presenter = ListaPresupuestosPresenter()
        
        let api = FirebaseAPI()
        let interactor = ListaPresupuestosInteractor(presenter: presenter, api: api)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let view = storyboard.instantiateViewController(withIdentifier: "ListaPresupuestosViewController") as! ListaPresupuestosViewController
        view.tabBarItem.image = UIImage(systemName: "list.bullet.clipboard.fill")
        view.title = "Presupuestos"
        
        let router = ListaPresupuestosRouter()
        router.presenter = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        view.presenter = presenter
        
        return view
    }
}
