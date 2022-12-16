//
//  FormCategoriaInteractor.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 16/12/22.
//

import Foundation

protocol FormCategoriaInteractorProtocol {
    
}

class FormCategoriaInteractor {
    unowned var presenter: FormCategoriaPresenterProtocol
    var api: RemoteRepository
    
    required init(presenter: FormCategoriaPresenterProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
}

extension FormCategoriaInteractor: FormCategoriaInteractorProtocol {
    
}
