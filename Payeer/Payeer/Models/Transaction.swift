//
//  Transaction.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 23/07/2021.
//

import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    let title: String
    let date: Date = Date()
    let amount: Double
    let reference: String
    
    
    static let examples: [Transaction] = (0..<9).map { number in
        Transaction(title: "Direct Transfer",
                    amount: 2509,
                    reference: UUID().uuidString)
    }
}
