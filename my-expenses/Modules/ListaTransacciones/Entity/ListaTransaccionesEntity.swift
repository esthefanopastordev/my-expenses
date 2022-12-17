//
//  Transaction.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 4/12/22.
//

import Foundation

struct TransaccionEntity {
    let id: String
    let descripcion: String
    let cantidad: Double
    let fecha: String
    let categoria: Categoria
    let tipo: String
    let nota: String
}

struct TransaccionViewModel {
    let id: String
    let icono: String
    let descripcion: String
    let categoria: String
    let cantidad: String
    let tipo: String
}
