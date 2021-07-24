//
//  ActionHeaderView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 24/07/2021.
//

import SwiftUI

struct ActionHeaderView: View {
    let title: String
    let icon: String?
    let action: () -> Void
    
    init(title: String,
         icon: String? = nil,
         action: @escaping() -> Void) {
        self.title = title
        self.icon = icon
        self.action = action
    }
    var body: some View {
        HStack {
            Text(title)
                .font(Font.title.weight(.medium))
            Spacer()
            if let name = icon {
                Image(systemName: name)
                    .imageScale(.large)
                    .foregroundColor(.mainGray)
                    .onTapGesture(perform: action)
            }
        }
    }
}

struct ActionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ActionHeaderView(title: "The title", action: {})
    }
}
