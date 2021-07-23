//
//  ServiceCardView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 23/07/2021.
//

import SwiftUI


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


struct ServiceCardView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceCardView(title: "000", subtitle: "Subtitle here", color: .red)
    }
}
