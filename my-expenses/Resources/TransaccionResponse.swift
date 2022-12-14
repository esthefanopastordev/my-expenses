//
//  TransaccionResponse.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import Foundation
import FirebaseFirestoreSwift

class TransaccionResponse: Codable {
    @DocumentID var id: String?
    var descripcion: String
    var cantidad: Double
    var fecha: String
    var categoriaId: String
    var tipo: String
    var nota: String
}
