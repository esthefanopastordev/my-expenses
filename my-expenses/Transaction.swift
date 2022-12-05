//
//  Transaction.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 4/12/22.
//

import Foundation

struct Transaction {
    let id: String
    let name: String
    let amount: Double
    let date: Date
    let categoryId: String
    let type: String
    let description: String
    let images: [String]
    
    init(id: String, name: String, amount: Double, date: Date, categoryId: String, type: String, description: String, images: [String]) {
        self.id = id
        self.name = name
        self.amount = amount
        self.date = date
        self.categoryId = categoryId
        self.type = type
        self.description = description
        self.images = images
    }
}
