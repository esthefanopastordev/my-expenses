//
//  FormTransaccionRouter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import UIKit

protocol FormTransaccionRouterProtocol {
    func dismiss()
}

class FormTransaccionRouter: FormTransaccionRouterProtocol {
    var view: UIViewController?
    var delegate: FormTransaccionBuilderDelegate
    
    required init(delegate: FormTransaccionBuilderDelegate) {
        self.delegate = delegate
    }
    
    func dismiss() {
        view?.dismiss(animated: true)
        delegate.formTransaccionBuilder(didCreate: view!)
    }
}
