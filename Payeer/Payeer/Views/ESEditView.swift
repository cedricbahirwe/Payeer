//
//  ESEditView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 24/07/2021.
//

import SwiftUI

struct ESEditView: View {
    @State var employee: Employee
    @State private var employeeRoles: [EmployeRole] = EmployeRole.allCases
    @State private var showDropDown = false
    
    var body: some View {
        VStack(spacing: 0) {
            NavHeaderView(employee.name,rIcon: "trash",
                          rAction: {})
            
            Image("placeholder")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            
            VStack(spacing: 20) {
                Button(action: {}, label: {
                    Image(systemName: "camera")
                        .imageScale(.large)
                        .foregroundColor(.white)
                        .frame(width: 50,height: 50)
                        .background(Color.mainBlue)
                        .clipShape(Circle())
                })
                VStack(spacing: 8) {
                    HStack(spacing: 10) {
                        Text("Name")
                            .font(.caption)
                            .opacity(0.7)
                            .frame(width: 65, alignment: .leading)
                        TextField("",
                                  text: $employee.firstName)
                    }
                    Color.gray.frame(height: 0.8)
                }
                
                ZStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(alignment: showDropDown ? .top : .center, spacing: 10) {
                            Text("Role")
                                .font(.caption)
                                .opacity(0.7)
                                .frame(width: 65, alignment: .leading)
                            CategoriesDropDown(categories: employeeRoles.map(\.rawValue),
                                               showDropDown: $showDropDown)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        if !showDropDown { Color.gray.frame(height: 0.8) }
                        
                    }
                    .zIndex(2)
                    VStack(spacing: 8) {
                        HStack(spacing: 10) {
                            Text("Account")
                                .font(.caption)
                                .opacity(0.7)
                                .frame(width: 65, alignment: .leading)
                            TextField("abc.rst@xyz.com",
                                      text: .constant(""))
                        }
                        Color.gray.frame(height: 0.8)
                        
                        Spacer()
                        Button(action: {}) {
                            
                            Text("Save")
                                .font(Font.body.weight(.semibold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 48)
                                .background(Color.mainBlue)
                                .clipShape(Capsule())
                        }
                        
                    }
                    .offset(y: 55)
                    .padding(.bottom, 75)
                }
            }
            .offset(y: -25) // For camera button
            .padding(.horizontal)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct ESEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ESEditView(employee: .examples.first!)
        }
    }
}
