//
//  ESDetailsView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 24/07/2021.
//

import SwiftUI

struct ESDetailsView: View {
    let employee: Employee
    
    @State private var showEditMode = false
    var body: some View {
        VStack(spacing: 0) {
            NavHeaderView(employee.name)
                .overlay(
                    NavigationLink(
                        destination: ESEditView(employee: employee)) {
                        Image(systemName: "pencil")
                            .imageScale(.large)
                            .foregroundColor(.mainGray)
                            .padding(10)
                    }
                    , alignment: .trailing
                )
            
            Image("placeholder")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            
            LargeAmountLabel(amount: employee.salesAmount)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.secondaryBg)
            
            TransactionsList()
            
        }        
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct ESDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ESDetailsView(employee: .examples.first!)
        }
    }
}
