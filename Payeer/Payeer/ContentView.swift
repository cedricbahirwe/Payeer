//
//  ContentView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 22/07/2021.
//

import SwiftUI

enum LocalStore {
    static let isLoggedIn = "isLoggedIn"
    static let hasAccount = "hasAccount"
}

struct ContentView: View {
    
    @State private var selection: Int = 1
    @AppStorage(LocalStore.isLoggedIn) var isLoggedIn: Bool = false
    @AppStorage(LocalStore.hasAccount) var hasAccount: Bool = false
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
            EmployeeSalesView()
                .tabItem {
                    Image(systemName: "person.2")
                }
                .tag(4)
            
            AppSettingsView()
                .tabItem {
                    Image(systemName: "gear")
                }
                .tag(5)
        }
        .fullScreenCover(isPresented: $isLoggedIn.inverted()){
            LoginView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
