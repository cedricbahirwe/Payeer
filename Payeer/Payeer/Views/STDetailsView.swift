//
//  STDetailsView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 22/07/2021.
//

import SwiftUI
import MapKit

struct STDetailsView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

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
                Image(systemName: "share")
                    .onTapGesture {
                        withAnimation {
//                            showCalendar.toggle()
                        }
                    }
            }
            .foregroundColor(.secondary)
            .padding(10)
            Divider()
            let transaction = Transaction.examples.first!
            
            TransactionRowView(transaction: transaction)
                .padding(8)
                .background(Color(.secondarySystemBackground))
            
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
                    .foregroundColor(.secondary)
                
            }
            .padding(8)
            
            VStack(alignment: .leading, spacing: 3) {
                Text("Details status")
                    .font(Font.callout.weight(.semibold))
                Text("Payment Under Contract #D512-3445")
                    .font(.callout)
                    .fontWeight(.regular)
                    .foregroundColor(.secondary)
                    .opacity(0.8)
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(8)
            .background(Color(.secondarySystemBackground))

            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))), interactionModes: [])
        }
    }
}

struct STDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        STDetailsView()
    }
}
