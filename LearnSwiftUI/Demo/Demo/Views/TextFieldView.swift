//
//  TextFieldView.swift
//  Demo
//
//  Created by stnts on 2023/8/31.
//

import SwiftUI

struct TextFieldView: View {
    
    @State private var name = "Paul"
    
    var body: some View {
        TextField("Shout your name at me", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .textCase(.uppercase)
            .padding(.horizontal)
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
