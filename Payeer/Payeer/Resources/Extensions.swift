//
//  Extensions.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 22/07/2021.
//

import SwiftUI

let size = UIScreen.main.bounds.size

extension Color {
    static let mainBlue = Color("mainBlue")
    static let mainGray = Color("mainGray")
    static let secondaryBg = Color(.secondarySystemBackground)
}


/// Convert the `get` and `set` of a bool
/// Important when getting opposite value of a boolean
extension Binding where Value == Bool {
    func inverted() -> Binding<Bool> {
        Binding(
            get: { !wrappedValue },
            set: { wrappedValue = !$0 }
        )
        
    }
}
