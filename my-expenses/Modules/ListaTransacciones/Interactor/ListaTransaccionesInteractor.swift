//
//  ListaTransaccionesInteractor.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import Foundation

class ListaTransaccionesInteractor: ListaTransaccionesInteractorProtocol {
    let presenter: ListaTransaccionesPresenterOutputProtocol
    
    let api: RemoteRepository
    
    required init(presenter: ListaTransaccionesPresenterOutputProtocol, api: RemoteRepository) {
        self.presenter = presenter
        self.api = api
    }
    
    @MainActor
    func transacciones() {
        Task.init {
            let transacciones = await api.fetchTransacciones()
            var mappedTransacciones: [TransaccionEntity] = []
            for transaccion in transacciones {
                guard let category = await api.fetchCategoria(por: transaccion.categoriaId) else { return }
                
                let categoria = Categoria(id: category.id!, nombre: category.nombre, tipo: category.tipo, icono: category.icono)
                let mappedTransaccion = TransaccionEntity(id: transaccion.id!, descripcion: transaccion.descripcion, cantidad: transaccion.cantidad, fecha: transaccion.fecha, categoria: categoria, tipo: transaccion.tipo, nota: transaccion.nota)
                
                mappedTransacciones.append(mappedTransaccion)
            }
            presenter.showTransacciones(mappedTransacciones)
        }
    }
}
