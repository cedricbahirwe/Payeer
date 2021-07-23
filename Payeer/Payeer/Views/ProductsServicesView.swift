//
//  ProductsServicesView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 23/07/2021.
//

import SwiftUI


enum ServiceCategory: String, Equatable {
    case webdevelopment = "Web Development"
    case wedesign = "Web Design"
    case design = "Design"
    case marketing = "Marketing"
    case management = "Management"
    case outsourcing = "Outsourcing"
    
    var color: Color {
        switch self {
        case .webdevelopment: return .purple
        case .marketing: return .red
        case .outsourcing: return .green
        case .design: return Color(UIColor.systemTeal)
        default:
            return .black
        }
    }
    
}
struct ServiceItem: Identifiable {
    let id = UUID()
    let title: String
    let category: ServiceCategory
    let qty: Int
    let description: String?
    
    static let examples: [ServiceItem] = [
        ServiceItem(title: "Web Services", category: .marketing, qty: 34,description: nil),
        ServiceItem(title: "Html Markup", category: .design, qty: 42,description: nil),
        ServiceItem(title: "Mobile App Design", category: .management, qty: 56,description: nil),
        ServiceItem(title: "Website Design", category: .outsourcing, qty: 80,description: nil),
        ServiceItem(title: "Landing Page Design", category: .wedesign, qty: 28,description: nil),
        ServiceItem(title: "Marketing & SEO", category: .webdevelopment, qty: 345,description: nil),
    ]
}


struct ProductsServicesView: View {
    
    private let services = ServiceItem.examples
    
    private var totalServices: Int {
        services.map(\.qty).reduce(0, +)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                MainSearchField()
                
                ActionHeaderView(title: "Your Services",
                                 icon: "plus",
                                 action: {})
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
    }
}

struct ProductsServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsServicesView()
    }
}

struct ServiceCardView: View {
    let title: String
    let subtitle: String
    let color: Color
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(Font.largeTitle.weight(.semibold))
            Text(subtitle)
                .font(Font.callout.weight(.medium))
                .truncationMode(.middle)
        }
        .foregroundColor(.white)
        .padding()
        .frame(width: 150, height: 100, alignment: .leading)
        .background(color)
        .cornerRadius(20)
    }
}
