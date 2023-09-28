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
            

            
        }.padding()
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
