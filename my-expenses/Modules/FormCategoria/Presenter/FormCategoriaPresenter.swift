//
//  FormCategoriaPresenter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 16/12/22.
//

import Foundation

protocol FormCategoriaPresenterProtocol: AnyObject {
    
}

class FormCategoriaPresenter {
    var view: FormCategoriaViewProtocol?
    var interactor: FormCategoriaInteractorProtocol?
    var router: FormCategoriaRouterProtocol?
}

extension FormCategoriaPresenter: FormCategoriaPresenterProtocol {
    
}
