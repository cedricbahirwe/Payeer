//
//  DashBoardView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 22/07/2021.
//

import SwiftUI

struct SummaryItem: Identifiable {
    let id = UUID()
    let name: String
    let amount: Double
}

struct DashBoardView: View {
    private let summary: [SummaryItem] = [
        
        .init(name: "Gross Sales", amount: 2509.00),
        .init(name: "Net Sales", amount: 2509.00),
        .init(name: "Discounts", amount: 4325.00),
        .init(name: "Cash Transactions", amount: 545.00),
        .init(name: "Taxes", amount: 125.00),
        
    ]
    var body: some View {
        VStack(spacing: 0) {
            VStack {
            MainSearchField("Seach for transactions",
                            text: .constant("Seach for transactions"))
            
            ActionHeaderView(title: "Sales Summary", action: {})
            }
            .padding([.horizontal, .bottom], 10)
            
            RoundedRectangle(cornerRadius: 20)
                .overlay(Text("Graph View")
                            .font(.largeTitle)
                            .foregroundColor(.white))
                .padding(10)

            
            ScrollView {
                ForEach(summary) { item in
                    HStack {
                        Text(item.name)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(String(format: "$%.2f", item.amount))
                        
                    }
                    .padding(.vertical, 10)
                }
            }
            .padding(10)
        }
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}

struct MainSearchField: View {
    
    let placeholder: String
    @Binding var text: String
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        _text = text
    }
    
    init() {
        placeholder = "Search for transactions"
        _text = .constant(placeholder)
    }
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            TextField(placeholder,
                      text: $text)
        }
        .foregroundColor(.secondary)
        .padding(.horizontal, 15)
        .frame(height: 45)
        .overlay(Capsule().stroke(Color.secondary))
    }
}
