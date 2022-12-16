//
//  FormPresupuestoBuilder.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 16/12/22.
//

import Foundation
import UIKit

protocol FormPresupuestoBuilderDelegate {
    func formPresupuestoBuilder(didCreatePresupuesto view: UIViewController)
}

class FormPresupuestoBuilder {
    func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let view = storyboard.instantiateViewController(withIdentifier: "FormPresupuestoViewController") as! FormPresupuestoViewController
        
        return view
    }
}
