//
//  NavHeaderView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 24/07/2021.
//

import SwiftUI

struct NavHeaderView: View {
    
    @Environment(\.presentationMode)
    private var presentationMode
    
    private let title: String
    private let lIcon: String
    private let rIcon: String?
    let lAction: (() -> Void)?
    let rAction: (() -> Void)
    
    
    internal init(_ title: String,
                  lIcon: String = "chevron.left",
                  rIcon: String? = nil,
                  lAction: (() -> Void)? = nil,
                  rAction:  @escaping() -> Void = { }) {
        
        self.title = title
        self.lIcon = lIcon
        self.rIcon = rIcon
        self.rAction = rAction
        self.lAction = lAction

    }
    
    var body: some View {
        HStack {
            if !lIcon.isEmpty {
                Image(systemName: lIcon)
                    .imageScale(.large)
                    .onTapGesture {
                        if let action = lAction {
                            action()
                        } else {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
            }
            Spacer()
            
            Text(title)
                .font(.headline)
                .fontWeight(.medium)
                .textCase(.uppercase)
            Spacer()

            
            if rIcon != nil {
                Image(systemName: rIcon!)
                    .imageScale(.large)
                    .onTapGesture(perform: rAction)
            }        }
        .foregroundColor(.mainGray)
        .padding(10)
    }
}

struct NavHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NavHeaderView("Title here")
    }
}
