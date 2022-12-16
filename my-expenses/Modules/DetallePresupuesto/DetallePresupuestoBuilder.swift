//
//  DetallePresupuestoBuilder.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 16/12/22.
//

import UIKit

protocol DetallePresupuestoBuilderDelegate {
    
}

class DetallePresupuestoBuilder {
    private var delegate: DetallePresupuestoBuilderDelegate?
    
    func build() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let view = storyboard.instantiateViewController(withIdentifier: "DetallePresupuestoViewController") as! DetallePresupuestoViewController
        
        return view
    }
}
