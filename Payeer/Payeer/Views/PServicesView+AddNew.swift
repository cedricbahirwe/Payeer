//
//  PServicesView+AddNew.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 23/07/2021.
//

import SwiftUI

struct PSAddNewView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    @State private var serviceCategories: [ServiceCategory] = ServiceCategory.allCases
    @State private var showDropDown = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Spacer()
                Text("Add New Service")
                    .textCase(.uppercase)
                    .font(Font.title3.bold())
                    .textCase(.uppercase)
                    .foregroundColor(.primary)
                Spacer()
            }
            .foregroundColor(.mainGray)
            .padding(10)
            
            Image("placeholder")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            
            
            VStack(spacing: 10) {
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
                        TextField("Web Development",
                                  text: .constant("Web Development"))
                    }
                    Color.gray.frame(height: 0.8)
                }
                
                ZStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(alignment: showDropDown ? .top : .center, spacing: 10) {
                            Text("Category")
                                .font(.caption)
                                .opacity(0.7)
                                .frame(width: 65, alignment: .leading)
                            CategoriesDropDown(categories: serviceCategories.map(\.rawValue),
                                               showDropDown: $showDropDown)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        if !showDropDown { Color.gray.frame(height: 0.8) }
                        
                    }
                    .zIndex(2)
                    VStack(spacing: 8) {
                        HStack(spacing: 10) {
                            Text("Price")
                                .font(.caption)
                                .opacity(0.7)
                                .frame(width: 65, alignment: .leading)
                            TextField("Enter Amount",
                                      text: .constant(""))
                        }
                        Color.gray.frame(height: 0.8)
                        
                        Spacer()
                        Button(action: {}) {
                            
                            Text("Add")
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

struct PServicesView_AddNew_Previews: PreviewProvider {
    static var previews: some View {
        PSAddNewView()
    }
}


struct CategoriesDropDown: View {
    var categories: [String]
    @State var selectedCategory: String
    @Binding var showDropDown: Bool
    
    init(categories: [String], showDropDown: Binding<Bool>) {
        self.categories = categories
        _showDropDown = showDropDown
        self.selectedCategory =  categories.first!
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ForEach(showDropDown ? categories : [selectedCategory], id: \.self)  { category in
                HStack {
                    Text(category).padding(self.showDropDown ? 10 : 4)
                    Spacer()
                    if self.showDropDown == false {
                        Image(systemName: "chevron.down")
                            .foregroundColor(.mainGray)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedCategory = category
                        withAnimation(.spring()) {
                            showDropDown.toggle()
                        }
                }
            }
        }
        .frame(maxWidth: size.width/1.5, alignment: .leading)
        .background(showDropDown ? Color(.systemBackground) : .clear)
        .shadow(radius: showDropDown ? 3 : 0)
        
    }
}
