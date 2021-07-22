//
//  AddAccountView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 22/07/2021.
//

import SwiftUI

struct AddAccountView: View {
    var body: some View {
        ZStack {
            Color.mainBlue
            VStack(spacing: 0) {
                Image("header")
                    .resizable()
                    .scaledToFill()
                    .offset(y: -300)
                
                VStack(spacing: 30) {
                    Text("Connect your\ncurrent bank account")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    VStack(spacing: 8) {
                        HStack(spacing: 10) {
                            Text("Bank")
                                .font(.caption)
                                .opacity(0.7)
                                .frame(width: 65, alignment: .leading)
                            TextField("Enter name of your bank",
                                      text: .constant("Enter name of your bank"))
                        }
                        Color.gray.frame(height: 0.8)
                    }
                    
                    VStack(spacing: 8) {
                        HStack(spacing: 10) {
                            Text("Account")
                                .font(.caption)
                                .opacity(0.7)
                                .frame(width: 65, alignment: .leading)
                            TextField("Acccount number",
                                      text: .constant("16 digits number"))
                        }
                        Color.gray.frame(height: 0.8)
                    }
                    VStack(spacing: 8) {
                        HStack(spacing: 10) {
                            Text("Iban")
                                .font(.caption)
                                .opacity(0.7)
                                .frame(width: 65, alignment: .leading)
                            TextField("Iban",
                                      text: .constant("8 digits number"))
                        }
                        Color.gray.frame(height: 0.8)
                    }
                    
                    VStack(spacing: 8) {
                        HStack(spacing: 10) {
                            Text("Owner")
                                .font(.caption)
                                .opacity(0.7)
                                .frame(width: 65, alignment: .leading)
                            TextField("Enter your full name",
                                      text: .constant("Enter your full name"))
                        }
                        Color.gray.frame(height: 0.8)
                    }
                    
                    Button(action: {}) {
                        
                        Text("Next")
                            .font(.system(.body, design: .rounded))
                            .foregroundColor(.mainBlue)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color.white)
                            .clipShape(Capsule())
                    }
                    
                }
                .padding(.horizontal, 20)
                .offset(y: -250)
            }
            
        }
        .foregroundColor(.white)
        .ignoresSafeArea()
    }
}

struct AddAccountView_Previews: PreviewProvider {
    static var previews: some View {
        AddAccountView()
    }
}
