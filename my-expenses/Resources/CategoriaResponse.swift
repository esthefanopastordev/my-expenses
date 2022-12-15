//
//  CategoriaResponse.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import Foundation
import FirebaseFirestoreSwift

class CategoriaResponse: Codable {
    @DocumentID var id: String?
    let nombre: String
    let tipo: String
    let icono: String
}
