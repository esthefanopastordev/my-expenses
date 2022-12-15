//
//  FormTransaccionBuilder.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import Foundation
import UIKit

protocol FormTransaccionBuilderDelegate {
    func formTransaccionBuilder(didCreate viewController: UIViewController)
}

class FormTransaccionBuilder {
    public var delegate: FormTransaccionBuilderDelegate?
    
    func build() -> UIViewController {
        let router = FormTransaccionRouter(delegate: delegate!)
        
        let presenter = FormTransaccionPresenter()
        
        let api = FirebaseAPI()
        
        let interactor = FormTransaccionInteractor(presenter: presenter, api: api)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "FormTransaccionViewController") as! FormTransaccionViewController
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        
        router.view = view
        
        return view
    }
}
