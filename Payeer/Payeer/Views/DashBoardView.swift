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
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Seach for transactions",
                          text: .constant("Seach for transactions"))
            }
            .foregroundColor(.secondary)
            .padding(.horizontal, 15)
            .frame(height: 45)
            .overlay(Capsule().stroke(Color.secondary))
            
            Text("Sales Summary")
                .font(Font.largeTitle.bold())
            
            RoundedRectangle(cornerRadius: 20)
                .overlay(Text("Graph View")
                            .font(.largeTitle)
                            .foregroundColor(.white))
            
            ScrollView {
                ForEach(summary) { item in
                    HStack {
                        Text(item.name)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("$\(item.amount.description)")
                    }
                    .font(Font.body.weight(.semibold))
                    .padding(.vertical, 10)
                }
            }

            
        }
        .padding(10)
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardView()
    }
}
