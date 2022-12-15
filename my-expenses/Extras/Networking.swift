//
//  Networking.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import Foundation
import FirebaseFirestore

protocol RemoteRepository {
    func fetchTransacciones() async throws -> [TransaccionResponse]
    func deleteTransaccion(por id: String) async throws -> Void
    
    func fetchCategorias() async throws -> [CategoriaResponse]
    
    func fetchPresupuestos() async throws -> [PresupuestoResponse]
}

class FirebaseAPI: RemoteRepository {
    let db = Firestore.firestore()
    
    func fetchTransacciones() async throws -> [TransaccionResponse] {
        let docRef = db.collection("transaccion")
        let querySnapshot = try await docRef.getDocuments()
        return querySnapshot.documents.compactMap { document in try? document.data(as: TransaccionResponse.self) }
    }
    
    func deleteTransaccion(por id: String) async throws {
        let docRef = db.collection("transaccion")
        let querySnapshot = docRef.document(id)
        try await querySnapshot.delete()
    }
    
    func fetchCategorias() async throws -> [CategoriaResponse] {
        let docRef = db.collection("categoria")
        let querySnapshot = try await docRef.getDocuments()
        return querySnapshot.documents.compactMap { document in try? document.data(as: CategoriaResponse.self) }
    }
    
    func fetchPresupuestos() async throws -> [PresupuestoResponse] {
        let docRef = db.collection("presupuesto")
        let querySnapshot = try await docRef.getDocuments()
        return querySnapshot.documents.compactMap { document in try? document.data(as: PresupuestoResponse.self) }
    }
}
