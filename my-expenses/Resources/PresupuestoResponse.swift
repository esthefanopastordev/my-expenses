//
//  PresupuestoResponse.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 15/12/22.
//

import Foundation
import FirebaseFirestoreSwift

class PresupuestoResponse: Codable {
    @DocumentID var id: String?
    let monto: Double
    let categoriaId: String
}
