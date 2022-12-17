//
//  Networking.swift
//  my-expenses
//
//  Created by Esthefano Oniel Pastor Palacios on 14/12/22.
//

import Foundation
import FirebaseFirestore

protocol RemoteRepository {
    func fetchTransacciones() async -> [TransaccionResponse]
    func fetchCategoria(por id: String) async -> CategoriaResponse?
    
    func add(_ transaccion: NewTransaccion) async throws -> Void
    func deleteTransaccion(por id: String) async throws -> Void
    func fetchCategorias() async throws -> [CategoriaResponse]
    func fetchPresupuestos() async throws -> [PresupuestoResponse]
}

class FirebaseAPI: RemoteRepository {
    private let db = Firestore.firestore()
    
    // TODO: retornar errores
    func fetchTransacciones() async -> [TransaccionResponse] {
        let colRef = db.collection("transaccion")
        
        do {
            let querySnapshot = try await colRef.getDocuments()
            let data = try querySnapshot.documents.compactMap { document in
                return try document.data(as: TransaccionResponse.self)
            }
            return data
        } catch {
            print("Error")
            return []
        }
    }
    
    // TODO: retornar errores
    func fetchCategoria(por id: String) async -> CategoriaResponse? {
        let colRef = db.collection("categoria")
        
        do {
            let querySnapshot = colRef.document(id)
            let data = try await querySnapshot.getDocument().data(as: CategoriaResponse.self)
            return data
        } catch {
            print("Error")
            return nil
        }
    }
    
    
    
    func add(_ transaccion: NewTransaccion) async throws {
        let docRef = db.collection("transaccion")
        let newTransaccion = docRef.document()
        try newTransaccion.setData(from: transaccion)
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
