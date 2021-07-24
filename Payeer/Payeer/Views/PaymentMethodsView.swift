//
//  PaymentMethodsView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 23/07/2021.
//

import SwiftUI

enum PaymentMethodType: String, Equatable , CaseIterable {
    case cash, debitcreditcard, banktransfer, paymentproviders, coupons, giftcards
    
    var color: Color {
        switch self {
        case .cash:
            return .mainBlue
        case .debitcreditcard: return .purple
        case .banktransfer: return .red
        case .paymentproviders: return .orange
        case .coupons: return .green
        case .giftcards: return Color(UIColor.systemTeal)
        }
    }
}
struct PaymentMethod: Identifiable {
    let id = UUID()
    let name: String
    let type: PaymentMethodType
    var amount: Double = 0.0
    
    static let examples: [PaymentMethod] = [
        .init(name: "Cash", type: .cash, amount: 8010),
        .init(name: "Debit & Credit Cards", type: .debitcreditcard, amount: 1780),
        .init(name: "Bank Transfer", type: .banktransfer, amount: 6800),
        .init(name: "Payment Providers", type: .paymentproviders, amount: 1500),
        .init(name: "Coupons", type: .coupons, amount: 5500),
        .init(name: "Giftcards", type: .giftcards, amount: 5409),
    ]
}

struct PaymentMethodsView: View {
    
    private let pmethods = PaymentMethod.examples
    @Namespace private var animate
    @State private var showPieGraph = false
    private var totalAmount: Double {
        pmethods.map(\.amount).reduce(0, +)
    }
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    MainSearchField()
                    
                    ActionHeaderView(title: "Payment Methods",
                                     icon: "slider.vertical.3",
                                     action: {})
                }
                .padding([.horizontal, .bottom], 10)
                ZStack {
                    if showPieGraph {
                        
                        PieChartView(transactions: pmethods) {
                            String(format: "$%.2f", $0)
                        }
                        .matchedGeometryEffect(id: "chart", in: animate)
                        .frame(width: 250, height: 250)
                        .padding(.vertical)
                    } else {
                        VStack {
                            GeometryReader { geo in
                                HStack(spacing: 0) {
                                    ForEach(pmethods) { method in
                                        method.type.color
                                            .frame(width:  geo.size.width * CGFloat(method.amount/totalAmount))
                                    }
                                }
                            }
                            .frame(height: 40)
                            .transition(.scale)
                            
                            LargeAmountLabel(amount: totalAmount)
                                .padding(.vertical)
                                .matchedGeometryEffect(id: "chart", in: animate)
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .background(
                    Color.secondaryBg)
                .overlay(
                    Image(systemName: "chevron.down")
                        .foregroundColor(showPieGraph ? .mainGray :.white)
                        .rotationEffect(.degrees(showPieGraph ? 180 : 0))
                        .padding(8)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                showPieGraph.toggle()
                            }
                        }
                    , alignment: .topLeading
                )
                
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(0..<pmethods.count) { i in
                            let method = pmethods[i]
                            NavigationLink(
                                destination: PMDetailsView(payMethod: method)) {
                                PMethodRowView(method: method)
                                    .font(Font.callout.weight(.semibold))
                                    .padding(8)
                                    .padding(.vertical, 12)
                                    .background(
                                        Color.secondaryBg
                                            .opacity(i%2 != 0 ? 0.6 : 0)
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

struct PaymentMethodsView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodsView()
    }
}

struct PMethodRowView: View {
    let method: PaymentMethod
    var body: some View {
        HStack(spacing: 15) {
            
            Circle()
                .stroke(method.type.color, lineWidth: 3)
                .frame(width: 13, height: 13)
            Text(method.name)
                .foregroundColor(.primary)
            Spacer()
            
            Text(String(format: "$%.2f", method.amount))
                .foregroundColor(.mainBlue)
        }
    }
}
