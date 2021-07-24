//
//  STDetailsView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 22/07/2021.
//

import SwiftUI
import MapKit

struct STDetailsView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -1.939484, longitude: 30.074456), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Spacer()
                Text("Payment Details")
                    .font(Font.title3.bold())
                    .textCase(.uppercase)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "square.and.arrow.up")
                    .imageScale(.large)
            }
            .foregroundColor(.mainGray)
            .padding(10)
            Divider()
            let transaction = Transaction.examples.first!
            
            TransactionRowView(transaction: transaction)
                .padding(8)
                .background(Color.secondaryBg)
            
            VStack(alignment: .leading, spacing: 3) {
                HStack {
                    Text("Transaction status")
                        .font(Font.callout.weight(.semibold))
                    Spacer()
                    Label("Completed", systemImage: "checkmark.circle.fill")
                        .foregroundColor(.green)
                }
                Text(transaction.date, style: .date)
                    .font(.callout)
                    .fontWeight(.light)
                    .foregroundColor(.mainGray)
                
            }
            .padding(8)
            
            VStack(alignment: .leading, spacing: 3) {
                Text("Details status")
                    .font(Font.callout.weight(.semibold))
                Text("Payment Under Contract #D512-3445")
                    .font(.callout)
                    .fontWeight(.regular)
                    .foregroundColor(.mainGray)
                    .opacity(0.8)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(8)
            .background(Color.secondaryBg)

            Map(coordinateRegion: $region, interactionModes: [.zoom])
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct STDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        STDetailsView()
    }
}
