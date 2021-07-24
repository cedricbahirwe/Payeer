//
//  PieChartView.swift
//  Payeer
//
//  Created by Cédric Bahirwe on 23/07/2021.
//

import SwiftUI

struct PieChartView: View {
    let values: [Double]
    let names: [String]
    let formatter: (Double) -> String
    
    var colors: [Color]
    var backgroundColor: Color
    
    var widthFraction: CGFloat
    var innerRadiusFraction: CGFloat
    
    @State private var activeIndex: Int = -1
    
    var slices: [PieSliceData] {
        let sum = values.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceData] = []
        
        for (i, value) in values.enumerated() {
            let degrees: Double = value * 360 / sum
            tempSlices.append(PieSliceData(startAngle: Angle(degrees: endDeg), endAngle: Angle(degrees: endDeg + degrees), text: String(format: "%.0f%%", value * 100 / sum), color: self.colors[i]))
            endDeg += degrees
        }
        return tempSlices
    }
    
    init(transactions:[PaymentMethod],
         backgroundColor: Color = Color(.systemBackground),
         formatter: @escaping (Double) -> String,
         widthFraction: CGFloat = 1.0,
         innerRadiusFraction: CGFloat = 0.70) {
        
        self.values = transactions.map(\.amount)
        self.names = transactions.map(\.name)
        self.formatter = formatter
        
        self.colors = transactions.map(\.type).map(\.color)
        self.backgroundColor = backgroundColor
        self.widthFraction = widthFraction
        self.innerRadiusFraction = innerRadiusFraction
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<values.count){ i in
                    PieSlice(pieSliceData: self.slices[i])
                        .scaleEffect(activeIndex == i ? 1.03 : 1)
                        .animation(.spring())
                }
                .frame(width: widthFraction * geometry.size.width, height: widthFraction * geometry.size.width)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            let radius = 0.5 * widthFraction * geometry.size.width
                            let diff = CGPoint(x: value.location.x - radius, y: radius - value.location.y)
                            let dist = pow(pow(diff.x, 2.0) + pow(diff.y, 2.0), 0.5)
                            if (dist > radius || dist < radius * innerRadiusFraction) {
                                activeIndex = -1
                                return
                            }
                            var radians = Double(atan2(diff.x, diff.y))
                            if (radians < 0) {
                                radians = 2 * Double.pi + radians
                            }
                            
                            for (i, slice) in slices.enumerated() {
                                if (radians < slice.endAngle.radians) {
                                    activeIndex = i
                                    break
                                }
                            }
                        }
                        .onEnded { value in
                            activeIndex = -1
                        }
                )
                Circle()
                    .fill(backgroundColor)
                    .frame(width: widthFraction * geometry.size.width * innerRadiusFraction, height: widthFraction * geometry.size.width * innerRadiusFraction)
                
                VStack {
                    Text(formatPoints(from: Int(activeIndex == -1 ? values.reduce(0, +) : values[activeIndex])))
                        .font(.system(.title, design: .rounded))
                        .foregroundColor(.primary)
                    Text(activeIndex == -1 ? "Total" : names[activeIndex])
                        .font(.headline)
                        .foregroundColor(.mainGray)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
                
            }
        }
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(transactions: PaymentMethod.examples, formatter: {value in String(format: "$%.2f", value)})
    }
}
fileprivate func formatPoints(from: Int) -> String {
    
    let number = Double(from)
    let thousand = number / 1000
    let million = number / 1000000
    let billion = number / 1000000000
    
    if billion >= 1.0 {
        return "\(round(billion*10)/10)B"
    } else if million >= 1.0 {
        return "\(round(million*10)/10)M"
    } else if thousand >= 1.0 {
        return ("\(round(thousand*10/10))K")
    } else {
        return "\(Int(number))"
    }
}
