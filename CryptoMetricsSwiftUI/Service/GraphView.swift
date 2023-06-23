//
//  Graph.swift
//  CryptoMetrics
//
//  Created by Danila Kardashevkii on 07.06.2023.
//

import SwiftUI
import Combine
import WidgetKit

struct GraphView: View {
    let data: [Double]
    let maxY: Double
    let minY: Double
    let yfirst: Double
    let ylast: Double
    var ColorGraph = ""


    init(price: [Double]){
        data = price // Используйте свойство `price` вместо `coin. ?? []`
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
        yfirst = data.first ?? 0
        ylast = data.last ?? 0
        print(data)
        if yfirst > ylast{
                      ColorGraph = "red"
                  }
                  else{
                      ColorGraph = "green"
                  }
    }

    var body: some View {

        VStack{

            CurveChart(data: data)
                .stroke(Color(ColorGraph), style: StrokeStyle(lineWidth: 1.5, lineCap: .round, lineJoin: .round)) // line
                      .background(
                          CurveChart(data: data, isBackground: true)
                            .fill(.linearGradient(colors: [Color(ColorGraph).opacity(0.4), .clear], startPoint: .top, endPoint: .bottom)) // background fill
                          )
                      .frame(width: 89,height: 30)
                      


        }
        .frame(width: 89,height: 43)
    }
}

struct CurveChart: Shape { // chnaged var to a Shape struct

    let data: [Double]
    var isBackground: Bool = false

    func path(in rect: CGRect) -> Path {
        Path { path in
            for index in data.indices {
                let xPosition: CGFloat = rect.width / CGFloat(data.count-1) * CGFloat(index)

                let maxY = data.max() ?? 0
                let minY = data.min() ?? 0

                let yAxis: CGFloat = maxY - minY

                let yPosition: CGFloat = (1 - CGFloat((Double(data[index]) - minY) / yAxis)) * rect.height

                if isBackground{
                    if index == 0{
                        path.move(to: CGPoint(x: 0, y: rect.height))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
                else{
                    if index == 0{
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
            }
            if isBackground { // this is needed so the backkground shape is filled correctly (closing the shape)
                path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            }
        }

    }
}


struct plotPoint: Shape { // chnaged var to a Shape struct

    let data: [Double]
    let index: Int
    let size = 20.0

    func path(in rect: CGRect) -> Path {

        let xStep = rect.width / Double(data.count-1)
        let yStep = rect.height / (data.max() ?? 0)

        let xCenter = Double(index) * xStep
        let yCenter = rect.height - yStep * data[index]

        var path = Path()
        path.addEllipse(in: CGRect(x: xCenter - size/2, y: yCenter - size/2, width: size, height: size))

        return path
    }
}

