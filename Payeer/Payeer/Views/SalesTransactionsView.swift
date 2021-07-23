//
//  SalesTransactionsView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 22/07/2021.
//

import SwiftUI

struct SalesTransactionsView: View {
    let transactions:[Transaction] = Transaction.examples
    @Environment(\.presentationMode) private var presentationMode
    @State private var showCalendar = false
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                Group {
                    MainSearchField("Search for transactions", text: .constant("Search for transactions"))
                    HStack {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                        Spacer()
                        Text("Transactions")
                            .font(Font.title3)
                            .fontWeight(.medium)
                            .textCase(.uppercase)
                            .foregroundColor(.primary)
                        Spacer()
                        Image(systemName: "calendar")
                            .onTapGesture {
                                withAnimation {
                                    showCalendar.toggle()
                                }
                            }
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
                            
                            TransactionRowView(transaction: transaction)
                                .padding(8)
                                .background(
                                    Color(.secondarySystemBackground)
                                        .opacity(index % 2 == 0 ? 1 : 0.5)
                                )
                        }
                    }
                }
            }
            
            
            if showCalendar {
                Color.white.opacity(0.8)
                    .onTapGesture {
                        showCalendar.toggle()
                    }
                DatePickerView(isPresented: $showCalendar)
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct SalesTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        SalesTransactionsView()
    }
}

struct TransactionRowView: View {
    let transaction: Transaction
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text(transaction.title)
                    .font(Font.callout.weight(.semibold))
                Spacer()
                Text(String(format: "$%.2f", transaction.amount))
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
    }
}
