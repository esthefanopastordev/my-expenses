//
//  Transaction.swift
//  my-expenses
//
//  Created by Esthefano Pastor on 4/12/22.
//

import Foundation

struct Transaction {
    let name: String
    let amount: Double
    let categoryId: String
    let description: String
    let images: [String]
    
    init(name: String, amount: Double, categoryId: String, description: String, images: [String]) {
        self.name = name
        self.amount = amount
        self.categoryId = categoryId
        self.description = description
        self.images = images
    }
}
