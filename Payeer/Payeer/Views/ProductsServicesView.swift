//
//  ProductsServicesView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 23/07/2021.
//

import SwiftUI

struct ProductsServicesView: View {
    private let services = ServiceItem.examples
    @State private var addNewService = false
    private var totalServices: Int {
        services.map(\.qty).reduce(0, +)
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack {
                    NavigationLink(destination: PSAddNewView(),
                                   isActive: $addNewService) { }
                    
                    MainSearchField()
                    
                    ActionHeaderView(title: "Your Services",
                                     icon: "plus") {
                        addNewService.toggle()
                    }
                }
                .padding([.horizontal, .bottom], 10)
                Divider()
                ScrollView {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ServiceCardView(title: totalServices.description,
                                            subtitle: "All services",
                                            color: .mainBlue)
                                .padding(.leading)
                            ForEach(services) { service in
                                ServiceCardView(title: service.qty.description,
                                                subtitle: service.title,
                                                color: service.category.color)
                            }
                        }
                    }
                    .padding(.top, 5)
                    
                    VStack(spacing: 0) {
                        ForEach(0..<services.count) { i in
                            let service = services[i]
                            HStack(spacing: 10) {
                                Image("image\(i+1)")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 45, height: 45)
                                    .clipShape(Circle())
                                VStack(spacing: 0) {
                                    HStack {
                                        Text(service.title)
                                            .opacity(0.8)
                                        Spacer()
                                        Text(service.qty.description)
                                            .foregroundColor(.mainBlue)
                                    }
                                    HStack {
                                        Text(service.category.rawValue)
                                        Spacer()
                                        Text("Number of Sales")
                                    }
                                    .opacity(0.5)
                                    .font(.callout)
                                }
                            }
                            .padding(10)
                            .background(
                                Color(.secondarySystemBackground)
                                    .opacity(i%2==0 ? 0 : 1)
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

struct ProductsServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsServicesView()
    }
}
