//
//  SalesTransactionsView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 22/07/2021.
//

import SwiftUI

struct Transaction: Identifiable {
    let id = UUID()
    let title: String
    let date: Date = Date()
    let amount: Double
    let reference: String
    
    
    static let examples: [Transaction] = (0..<9).map { number in
        Transaction(title: "Direct Transfer",
                    amount: 2509.00,
                    reference: UUID().uuidString)
    }
}

struct SalesTransactionsView: View {
    let transactions:[Transaction] = Transaction.examples
    var body: some View {
    
        VStack(spacing: 0) {
            Group {
                MainSearchField("Search for transactions", text: .constant("Search for transactions"))
                HStack {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                    Spacer()
                    Text("Transactions")
                        .font(Font.title3.bold())
                        .textCase(.uppercase)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "calendar")
                }
                .foregroundColor(.secondary)
                .padding(.vertical)
            }
            .padding(.horizontal, 10)

            Divider()
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<transactions.count) { index in
                        let transaction = transactions[index]
                        
                        VStack(spacing: 0) {
                            HStack {
                                Text(transaction.title)
                                
                                Spacer()
                                Text("$\(transaction.amount.description)")
                                    .foregroundColor(.mainBlue)
                            }
                            .font(Font.body.weight(.semibold))
                            HStack {
                                Text(transaction.date, style: .date)
                                    .font(.callout)
                                    .fontWeight(.light)
                                    .foregroundColor(.secondary)
                                Spacer()
                                
                                Text(transaction.reference.prefix(10))
                                    .foregroundColor(.secondary)
                            }
                            
                        }
                        .padding(8)
                        .background(
                            Color(.secondarySystemBackground)
                                .opacity(index % 2 == 0 ? 1 : 0.5)
                        )
                        
                    }
                }
            }
        }
    }
}

struct SalesTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        SalesTransactionsView()
    }
}
