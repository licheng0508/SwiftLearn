//
//  LabelView.swift
//  Demo
//
//  Created by stnts on 2023/9/1.
//

import SwiftUI

struct LabelView: View {
    var body: some View {
        VStack {
            
            Label("Your account", systemImage: "person.crop.circle")
                .padding()
            
            Label("Your account", systemImage: "person.crop.circle")
                .font(.title).padding()
            
            Label("Text Only", systemImage: "heart")
                .font(.title)
                .labelStyle(TitleOnlyLabelStyle())
                .padding()

            Label("Icon Only", systemImage: "star")
                .font(.title)
                .labelStyle(IconOnlyLabelStyle())
                .padding()

            Label("Both", systemImage: "paperplane")
                .font(.title)
                .labelStyle(TitleAndIconLabelStyle())
                .padding()
            
            Label {
                Text("Paul Hudson")
                    .foregroundColor(.primary)
                    .padding()
                    .font(.title3)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Capsule())
            } icon: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width: 32, height: 32)
            }
            .padding()
        }
        .padding()
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView()
    }
}
