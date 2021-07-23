//
//  ContentView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 22/07/2021.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
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
                .tag(2)
            LoginView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
                .tag(3)
            
            AddAccountView()
                .tabItem {
                    Image(systemName: "creditcard.fill")
                }
                .tag(4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

