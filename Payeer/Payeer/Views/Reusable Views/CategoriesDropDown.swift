//
//  CategoriesDropDown.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 24/07/2021.
//

import SwiftUI

struct CategoriesDropDown: View {
    var categories: [String]
    @State var selectedCategory: String
    @Binding var showDropDown: Bool
    
    init(categories: [String],
         selectedCategory: String? = nil,
         showDropDown: Binding<Bool>) {
        
        self.categories = categories
        self.selectedCategory =  selectedCategory ?? categories.first!
        _showDropDown = showDropDown
        
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ForEach(showDropDown ? categories : [selectedCategory], id: \.self)  { category in
                HStack {
                    Text(category)
                        .padding(showDropDown ? 10 : 4)
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



struct CategoriesDropDown_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesDropDown(categories: [], showDropDown: .constant(false))
    }
}
