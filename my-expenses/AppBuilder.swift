//
//  AppBuilder.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import UIKit

class AppBuilder {
    static func build() -> UIViewController {
        let tabBarController = UITabBarController()
        
        let homeViewController = ListaTransaccionesBuilder.build()
        let categoriesViewController = ListaCategoriasBuilder.build()
        let presupuestosViewController = ListaPresupuestosBuilder.build()
        
        tabBarController.setViewControllers([
            homeViewController,
            categoriesViewController,
            presupuestosViewController
        ], animated: true)
        
        return tabBarController
    }
}
