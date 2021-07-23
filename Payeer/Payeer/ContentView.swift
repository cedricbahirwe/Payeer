//
//  ContentView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 22/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Int = 1
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @AppStorage("hasAccount") var hasAccount: Bool = false
    var body: some View {
        TabView(selection: $selection) {
            DashBoardView()
                .tabItem {
                    Image(systemName: "speedometer")
                }
                .tag(1)
            
            PaymentMethodsView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                }
                .tag(2)
            
            
            ProductsServicesView()
                .tabItem {
                    Image(systemName: "bag")
                }
                .tag(3)
            LoginView()
                .onChange(of: isLoggedIn) { selection = $0  ? 5 : 4 }
                .tabItem {
                    Image(systemName: "person.fill")
                }
                .tag(4)
            
            AddAccountView()
                .tabItem {
                    Image(systemName: "creditcard.fill")
                }
                .tag(5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

