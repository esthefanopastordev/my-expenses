//
//  ListaTransaccionesProtocols.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 17/12/22.
//

import Foundation

protocol ListaTransaccionesViewProtocol: AnyObject {
    func showTransacciones()
}

protocol ListaTransaccionesInteractorProtocol {
    func transacciones()
}

protocol ListaTransaccionesPresenterInputProtocol {
    var balanceTotal: Double { get }
    var ingresosTotales: Double { get }
    var gastosTotales: Double { get }
    var numeroDeTransacciones: Int { get }
    
    func viewWillApper()
    func transaccion(for cell: Int) -> TransaccionViewModel
    func presentarForm()
    func presentarDetalle(_ transaccion: TransaccionResponse)
}

protocol ListaTransaccionesPresenterOutputProtocol {
    func showTransacciones(_ transacciones: [TransaccionEntity])
}

protocol ListaTransaccionesRouterProtocol {
    func mostrar(_ transaccion: TransaccionResponse)
    func mostrarForm()
}
