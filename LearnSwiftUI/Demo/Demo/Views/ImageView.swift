//
//  ImageView.swift
//  Demo
//
//  Created by stnts on 2023/9/1.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        
        VStack{
            Image("dog")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 100)
                .padding()
            
            Image(systemName: "cloud.heavyrain.fill")
                .font(.largeTitle)
            

            Text("Hacking with Swift")
                .font(.system(size: 48))
                .padding(50)
                .background(
                    Image("dog")
                        .resizable()
                )
            
            Text("Hacking with Swift")
                .font(.largeTitle)
                .padding()
                .background(Circle()
                    .fill(Color.blue)
                    .frame(width: 50, height: 50))
            
            
            Text("Hacking with Swift")
                .font(.largeTitle)
                .padding(100)
                .background(
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                )
                .clipped()
            
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
            
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.green)
                .frame(width: 150, height: 100)
            
            Capsule()
                .fill(Color.green)
                .frame(width: 120, height: 60)
            
            Circle()
                .strokeBorder(Color.black, lineWidth: 20)
                .background(Circle().fill(Color.blue))
                .frame(width: 150, height: 150)
            
            ZStack {
                Circle()
                    .fill(.red)

                Circle()
                    .strokeBorder(Color.black, lineWidth: 20)
            }
            .frame(width: 150, height: 150)
            
            
            Circle().fill(.black, strokeBorder: .blue, lineWidth: 20).frame(width: 150, height: 150)
            
        }
        .padding()
        .padding(.bottom, 100)
    }
}

extension Shape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: CGFloat = 1) -> some View {
        self
            .stroke(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

extension InsettableShape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: CGFloat = 1) -> some View {
        self
            .strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
