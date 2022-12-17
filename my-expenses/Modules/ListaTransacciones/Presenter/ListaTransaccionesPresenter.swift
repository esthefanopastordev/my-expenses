//
//  ListaTransaccionesPresenter.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import Foundation

class ListaTransaccionesPresenter {
    private var transacciones: [TransaccionViewModel] = []
    
    weak var view: ListaTransaccionesViewProtocol?
    var interactor: ListaTransaccionesInteractorProtocol?
    var router: ListaTransaccionesRouterProtocol?

    private func cantidadTotal(_ tipoTransaccion: String) -> Double {
        var cantidadTotal = 0.00
        let filterdTransacciones = transacciones.filter { $0.tipo == tipoTransaccion }
        for transaccion in filterdTransacciones { cantidadTotal += Double(transaccion.cantidad)! }
        return cantidadTotal
    }
}

extension ListaTransaccionesPresenter: ListaTransaccionesPresenterInputProtocol {
    var balanceTotal: Double { ingresosTotales - gastosTotales }
    var ingresosTotales: Double { cantidadTotal("Ingreso") }
    var gastosTotales: Double { cantidadTotal("Gasto") }
    var numeroDeTransacciones: Int { transacciones.count }
    
    func viewWillApper() {
        interactor?.transacciones()
    }
    
    func transaccion(for cell: Int) -> TransaccionViewModel {
        return transacciones[cell]
    }
    
    func presentarForm() {
        router?.mostrarForm()
    }
    
    func presentarDetalle(_ transaccion: TransaccionResponse) {
        router?.mostrar(transaccion)
    }
}

extension ListaTransaccionesPresenter: ListaTransaccionesPresenterOutputProtocol {
    func showTransacciones(_ transacciones: [TransaccionEntity]) {
        self.transacciones = transacciones.map {
            TransaccionViewModel(
                id: $0.id,
                icono: $0.categoria.icono,
                descripcion: $0.descripcion,
                categoria: $0.categoria.nombre,
                cantidad: String($0.cantidad),
                tipo: $0.tipo
            )
        }
        view?.showTransacciones()
    }
}
