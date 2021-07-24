//
//  PMDetailsView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 24/07/2021.
//

import SwiftUI

struct PMDetailsView: View {
    @Environment(\.presentationMode)
    private var presentationMode
    let transactions:[Transaction] = Transaction.examples

    var payMethod: PaymentMethod

    var body: some View {
        VStack(spacing: 0) {
            VStack {
                MainSearchField()
                HStack {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                    Text("Cash")
                        .font(Font.title3.bold())
                        .textCase(.uppercase)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                        .imageScale(.large)
                }
                .foregroundColor(.secondary)
                .padding(10)
            }
            .padding(.horizontal, 10)
            
            Text(String(format: "$%.2f", payMethod.amount))
                .font(Font.headline)
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 20)
                .minimumScaleFactor(0.6)
                .background(Color.mainBlue)
                .clipShape(Capsule())
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color(.secondarySystemBackground))
            
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0..<transactions.count) { index in
                        let transaction = transactions[index]
                        
                        TransactionRowView(transaction: transaction)
                            .padding(8)
                            .background(
                                Color(.secondarySystemBackground)
                                    .opacity(index % 2 == 0 ? 0 : 1)
                        )
                    }
                }
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct PMDetailsView_Previews: PreviewProvider {
    static let example = PaymentMethod.examples.first!
    static var previews: some View {
        PMDetailsView(payMethod: example)
    }
}
