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
        .init(name: "Cash", type: .cash, amount: 8010.00),
        .init(name: "Debit & Credit Cards", type: .debitcreditcard, amount: 1780.00),
        .init(name: "Bank Transfer", type: .banktransfer, amount: 6800.00),
        .init(name: "Payment Providers", type: .paymentproviders, amount: 1500.00),
        .init(name: "Coupons", type: .coupons, amount: 5500.00),
        .init(name: "Giftcards", type: .giftcards, amount: 5409.00),
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
        VStack {
            Group {
                MainSearchField()
                
                ActionHeaderView(title: "Sales Summary",
                                 icon: "slider.vertical.3",
                                 action: {})
            }
            .padding(.horizontal, 10)
            ZStack {
                if showPieGraph {
                    
                    PieChartView(transactions: pmethods) {
                        String(format: "$%.2f", $0)
                    }
                    .matchedGeometryEffect(id: "chart", in: animate)
                    .frame(width: 200, height: 200)
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
                    
                    Text(String(format: "$%.2f", totalAmount))
                        .font(Font.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .minimumScaleFactor(0.6)
                        .background(Color.mainBlue)
                        .clipShape(Capsule())
                        .padding(.vertical)
                        .matchedGeometryEffect(id: "chart", in: animate)

                    }
                    

                }
                
                
            }
            .frame(maxWidth: .infinity)
            .background(
                Color(.secondarySystemBackground))
            .overlay(
                Image(systemName: "chevron.down")
                    .foregroundColor(showPieGraph ? .secondary :.white)
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
                        HStack(spacing: 15) {
                            
                            Circle()
                                .stroke(method.type.color, lineWidth: 3)
                                .frame(width: 13, height: 13)
                            Text(method.name)
                            Spacer()
                            
                            Text(String(format: "$%.2f", method.amount))
                                .foregroundColor(.mainBlue)
                        }
                        .font(Font.callout.weight(.semibold))
                        .padding(8)
                        .padding(.vertical, 12)
                        .background(
                            Color(.secondarySystemBackground)
                                .opacity(i%2 != 0 ? 0.6 : 0)
                        )
                    }
                }
            }
            Spacer()

        }
    }
}

struct PaymentMethodsView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodsView()
    }
}

struct ActionHeaderView: View {
    let title: String
    let icon: String
    let action: () -> Void
    var body: some View {
        HStack {
            Text(title)
                .font(Font.title.weight(.medium))
            Spacer()
            Image(systemName: icon)
                .imageScale(.large)
                .foregroundColor(.secondary)
                .onAppear(perform: action)
        }
    }
}
