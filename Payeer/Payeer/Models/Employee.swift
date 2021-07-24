//
//  Employee.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 24/07/2021.
//

import Foundation

enum EmployeRole: String, CaseIterable, Equatable {
    
    case salesManager = "Sales Manager"
    case supportTeam = "Support Team"
    case marketing = "Marketing Department"
    case developer = "Developer"
}

struct Employee: Identifiable {
    init(firstName: String, lastName: String, role: EmployeRole, sales: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.role = role
        self.salesAmount = sales
    }
    
    init(name: String, role: EmployeRole, sales: Double) {
        let names = name.components(separatedBy: " ")
        if names.count > 1 {
            self.firstName = names[0]
            self.lastName = names[1]
        } else {
            self.firstName = name
            self.lastName = ""
        }
        
        self.role = role
        self.salesAmount = sales
    }
    
    let id = UUID()
    let firstName: String
    let lastName: String
    let role: EmployeRole
    let salesAmount: Double
    
    var name: String {
        firstName + " " + lastName
    }
    
    static let examples: [Employee] = [
        .init(name: "Beulah Robertson", role: .salesManager, sales: 3120),
        .init(name: "John Smith", role: .supportTeam, sales: 4030),
        .init(name: "Alexander Roland", role: .salesManager, sales: 1850),
        .init(name: "James Black", role: .marketing, sales: 5300),
        .init(name: "Cédric Bahirwe", role: .salesManager, sales: 6500),
        .init(name: "Fraterne Bahirwe", role: .salesManager, sales: 2560),
        .init(name: "William Klein", role: .salesManager, sales: 5460),
        .init(name: "Garret Cooper", role: .salesManager, sales: 1890),
        
    ]
}
