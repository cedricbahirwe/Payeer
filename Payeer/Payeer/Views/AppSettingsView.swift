//
//  AppSettingsView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 24/07/2021.
//

import SwiftUI

struct AppSettingsView: View {
    @AppStorage(LocalStore.isLoggedIn)
    private var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    SettingsRowview(icon: "person",
                                    title: "Personal Settings",
                                    subtitle: "Account,  Photo, Email & More")
                    
                    SettingsRowview(icon: "wallet.pass",
                                    title: "Payment Account",
                                    subtitle: "Bank Account, Payment Options")
                        .background(Color(.systemBackground))
                    
                    SettingsRowview(icon: "lock",
                                    title: "Payment Account",
                                    subtitle: "Bank Account, Payment Options")
                    
                    SettingsRowview(icon: "info.circle",
                                    title: "About this app",
                                    subtitle: "Version, etc")
                        .background(Color(.systemBackground))
                }
                .frame(maxHeight: .infinity)
                
                
            }
            .background(Color.secondaryBg)
            .overlay(
                VStack {
                    Spacer()
                    Button(action: {
                        isLoggedIn = false
                    }) {
                        Text("Logout")
                            .bold()
                            .foregroundColor(isLoggedIn ? .mainBlue : .mainGray)
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .overlay(Capsule()
                                        .stroke(isLoggedIn ? Color.mainBlue : .mainGray)
                            )
                        
                    }
                }
                .padding(20)
            )
            .navigationTitle("Settings")
        }
    }
}

struct AppSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsView()
    }
}

struct SettingsRowview: View {
    let icon: String
    let title: String
    let subtitle: String
    
    private let darkGray = Color(red: 176/255,
                                 green: 183/255,
                                 blue: 196/255)
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .resizable()
                .padding(10)
                .scaledToFit()
                .frame(width: 40, height: 40)
                .background(darkGray)
                .clipShape(Circle())
                .foregroundColor(.white)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.callout)
                Text(subtitle)
                    .font(.system(size: 13))
                    .foregroundColor(.mainGray)
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}
