//
//  LinearGradientView.swift
//  Demo
//
//  Created by stnts on 2024/1/16.
//

import SwiftUI

struct LinearGradientView: View {
    var body: some View {
        
        VStack{
            Text("Hello World")
                .padding()
                .foregroundColor(.white)
                .font(.largeTitle)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                )
            
            Text("Hello World")
                .padding()
                .foregroundColor(.white)
                .font(.largeTitle)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .bottom)
                )
            
            Text("Hello World")
                .padding()
                .foregroundColor(.white)
                .font(.largeTitle)
                .background(
                    LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .leading, endPoint: .trailing)
                )
            
            Circle()
                .fill(
                    RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center, startRadius: 50, endRadius: 200)
                )
                .frame(width: 200, height: 200)
            
            Circle()
                .fill(
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                )
                .frame(width: 200, height: 200)
            
            Circle()
                .strokeBorder(
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360)),
                    lineWidth: 50
                )
                .frame(width: 200, height: 200)
        }.padding()
    }
}

#Preview {
    LinearGradientView()
}
