//
//  LoginView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 22/07/2021.
//

import SwiftUI


struct LoginView: View {
    @AppStorage(LocalStore.isLoggedIn)
    private var isLoggedIn: Bool = false
    var body: some View {
        ZStack {
            Color.mainBlue
            VStack(spacing: 0) {
                Image("header")
                    .resizable()
                    .scaledToFill()
                    .offset(y: -100)
                    .frame(maxWidth: size.width)
                    .clipped()
                    .overlay(
                        Text("Payeer")
                            .foregroundColor(.white)
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .scaleEffect(1.4)
                    )
                
                VStack(spacing: 20) {
                    
                    VStack(spacing: 8) {
                        HStack(spacing: 10) {
                            Text("Username")
                                .font(.caption)
                                .opacity(0.7)
                                .frame(width: 65, alignment: .leading)
                            TextField("Username",
                                      text: .constant("Enter your username"))
                        }
                        Color.gray.frame(height: 0.8)
                    }
                    
                    VStack(spacing: 8) {
                        HStack(spacing: 10) {
                            Text("Password")
                                .font(.caption)
                                .opacity(0.7)
                                .frame(width: 65, alignment: .leading)
                            TextField("Password",
                                      text: .constant("Enter password"))
                        }
                        Color.gray.frame(height: 0.8)
                    }
                    
                    
                    Button(action: {
                        isLoggedIn = true
                    }) {
                        Text("Login")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.mainBlue)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color.white)
                            .clipShape(Capsule())
                    }
                    
                    Button(action: {}, label: {
                        Text("Recover Your Password")
                    })
                    
                }
                .padding(.horizontal, 20)
                .offset(y: -80)
            }
            
        }
        .foregroundColor(.white)
        .ignoresSafeArea()
        .statusBar(hidden: true)
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
