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
        
        .init(name: "Gross Sales", amount: 2509),
        .init(name: "Net Sales", amount: 2509),
        .init(name: "Discounts", amount: 4325),
        .init(name: "Cash Transactions", amount: 545),
        .init(name: "Taxes", amount: 125),
        
    ]
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    MainSearchField("Seach for transactions",
                                    text: .constant(""))
                    
                    ActionHeaderView(title: "Sales Summary", action: {})
                }
                .padding([.horizontal, .bottom], 10)
                
                ScrollView {
                    VStack(spacing: 0) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.tertiarySystemFill))
                            .frame(height: 200)
                            .overlay(Text("Graph View")
                                        .font(.largeTitle)
                                        .foregroundColor(.primary))
                            .padding(10)
                        
                        ForEach(0..<summary.count) { i in
                            let item = summary[i]
                            NavigationLink(
                                destination: SalesTransactionsView()) {
                                HStack {
                                    Text(item.name)
                                        .foregroundColor(.mainGray)
                                    Spacer()
                                    Text(String(format: "$%.2f", item.amount))
                                    
                                }
                                .padding()
                                .background(
                                    Color.secondaryBg
                                        .opacity(i%2==0 ? 1 : 0)
                                )
                            }
                        }
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
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
        _text = .constant("")
    }
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            TextField(placeholder,
                      text: $text)
        }
        .foregroundColor(.mainGray)
        .padding(.horizontal, 15)
        .frame(height: 45)
        .overlay(Capsule().stroke(Color.mainGray))
    }
}
