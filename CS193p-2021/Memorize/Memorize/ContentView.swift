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
            
            Text("Hello, world! test git")
                .foregroundColor(.orange)
            
            Text("Hello, world!")
                .foregroundColor(.orange)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            }
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
