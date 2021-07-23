//
//  ServiceItem+Category.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 23/07/2021.
//

import SwiftUI

enum ServiceCategory: String, Equatable, CaseIterable {
    case webdevelopment = "Web Development"
    case wedesign = "Web Design"
    case design = "Design"
    case marketing = "Marketing"
    case management = "Management"
    case outsourcing = "Outsourcing"
    
    var color: Color {
        switch self {
        case .webdevelopment: return .purple
        case .marketing: return .red
        case .outsourcing: return .green
        case .design: return Color(UIColor.systemTeal)
        default:
            return .black
        }
    }
    
}
struct ServiceItem: Identifiable {
    let id = UUID()
    let title: String
    let category: ServiceCategory
    let qty: Int
    let description: String?
    
    static let examples: [ServiceItem] = [
        ServiceItem(title: "Web Services", category: .marketing, qty: 34,description: nil),
        ServiceItem(title: "Html Markup", category: .design, qty: 42,description: nil),
        ServiceItem(title: "Mobile App Design", category: .management, qty: 56,description: nil),
        ServiceItem(title: "Website Design", category: .outsourcing, qty: 80,description: nil),
        ServiceItem(title: "Landing Page Design", category: .wedesign, qty: 28,description: nil),
        ServiceItem(title: "Marketing & SEO", category: .webdevelopment, qty: 345,description: nil),
    ]
}
