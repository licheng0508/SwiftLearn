//
//  ContentView.swift
//  Memorize
//
//  Created by stnts on 2021/9/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 3)
            
            Text("Hello, world!")
                .foregroundColor(.orange)
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
