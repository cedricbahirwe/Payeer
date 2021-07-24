//
//  STView+DatePicker.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 22/07/2021.
//

import SwiftUI

extension SalesTransactionsView {
    struct DatePickerView: View {
        
        @Binding var isPresented: Bool
        @State private var startDate = Date()
        @State private var endDate = Date(timeIntervalSinceNow: 86400*2)
        @State private var startSelected = true
        
        @Namespace var animation
        
        var blueBarView: some View {
            Color.mainBlue.frame(height: 2)
        }
        var body: some View {
            VStack {
                ZStack(alignment: .bottom) {
                    blueBarView
                        .opacity(0.2)
                        .overlay(
                            GeometryReader { geo in
                                HStack(spacing: 0) {
                                    if startSelected {
                                        blueBarView
                                            .frame(width: geo.size.width/2, alignment: .leading)
                                            .opacity(startSelected ? 1 : 0.0)
                                            .matchedGeometryEffect(id: "bar", in: animation)
                                    }
                                    Spacer()
                                    
                                    if !startSelected {
                                        blueBarView
                                            .frame(width: geo.size.width/2, alignment: .trailing)
                                            .opacity(!startSelected ? 1 : 0.0)
                                            .matchedGeometryEffect(id: "bar", in: animation)
                                    }
                                }
                            }
                            .frame(height: 2)
                        )
                    HStack(spacing: 0) {
                        Button(action: {
                            withAnimation(.spring()) {
                                startSelected = true
                            }
                        }) {
                            Text("From")
                                .bold()
                                .foregroundColor(startSelected ? .primary : .secondary)
                                .frame(maxWidth:.infinity)
                        }
                        Button(action: {
                            withAnimation {
                                startSelected = false
                            }
                        }) {
                            Text("To")
                                .bold()
                                .foregroundColor(!startSelected ? .primary : .secondary)
                                .frame(maxWidth:.infinity)

                        }
                    }
                    .padding(.bottom, 8)
                }
                
                DatePicker("", selection: startSelected ? $startDate : $endDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                
                Button(action: {
                    isPresented.toggle()
                }) {
                    
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .frame(width: 45, height: 45)
                        .foregroundColor(.mainBlue)
                        .opacity(0.5)
                }
                
            }
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(Color(.systemBackground))
            .cornerRadius(8)
            .shadow(radius: 4)
            .padding(15)
        }
    }

}
struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        SalesTransactionsView.DatePickerView(isPresented: .constant(false))
    }
}

