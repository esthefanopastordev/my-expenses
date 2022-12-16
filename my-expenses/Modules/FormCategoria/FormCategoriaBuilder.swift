//
//  FormCategoriaBuilder.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 16/12/22.
//

import UIKit

protocol FormCategoriaBuilderDelegate {
    
}

class FormCategoriaBuilder {
    public var delegate: FormCategoriaBuilderDelegate?
    
    func build() -> UIViewController {
        let router = FormCategoriaRouter(delegate: delegate!)
        
        let presenter = FormCategoriaPresenter()
        
        let api = FirebaseAPI()
        let interactor = FormCategoriaInteractor(presenter: presenter, api: api)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let view = storyboard.instantiateViewController(withIdentifier: "FormCategoriaViewController") as! FormCategoriaViewController
        view.presenter = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        router.view = view
        
        return view
    }
}
