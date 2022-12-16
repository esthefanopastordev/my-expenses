//
//  FormCategoriaRouter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 16/12/22.
//

import UIKit

protocol FormCategoriaRouterProtocol {
    
}

class FormCategoriaRouter {
    var view: UIViewController?
    var delegate: FormCategoriaBuilderDelegate
    
    required init(delegate: FormCategoriaBuilderDelegate) {
        self.delegate = delegate
    }
}

extension FormCategoriaRouter: FormCategoriaRouterProtocol {
    
}
