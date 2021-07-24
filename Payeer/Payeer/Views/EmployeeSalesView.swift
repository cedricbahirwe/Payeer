//
//  EmployeeSalesView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 24/07/2021.
//

import SwiftUI

struct EmployeeSalesView: View {
    let employees = Employee.examples

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    MainSearchField("Search for employee", text: .constant("Search for employee"))
                    
                    ActionHeaderView(title: "Sales by  employees",
                                     icon: "slider.vertical.3",
                                     action: {})
                    
                }
                .padding([.horizontal, .bottom], 10)
                Divider()
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(0..<employees.count) { i in
                            let employee = employees[i]
                            HStack(spacing: 10) {
                                Image("image\(i+1)")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 45, height: 45)
                                    .clipShape(Circle())
                                VStack(spacing: 3) {
                                    HStack {
                                        Text(employee.name)
                                            .opacity(0.8)
                                        Spacer()
                                        Text(String(format: "$%.2f", employee.salesAmount))
                                            .foregroundColor(.mainBlue)
                                    }
                                    HStack {
                                        Text(employee.role.rawValue)
                                        Spacer()
                                    }
                                    .foregroundColor(.mainGray)
                                    .font(.callout)
                                }
                            }
                            .padding(10)
                            .background(
                                Color.secondaryBg
                                    .opacity(i%2==0 ? 0.5 : 0)
                            )
                        }
                    }
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct EmployeeSalesView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeSalesView()
    }
}
