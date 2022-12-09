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
}
