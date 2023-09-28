//
//  TextView.swift
//  Demo
//
//  Created by stnts on 2023/8/31.
//

import SwiftUI

struct TextView: View {
    
    @State private var amount: CGFloat = 50
    @Environment(\.redactionReasons) var redactionReasons
    
    let bio = "The rain in Spain falls mainly on the Spaniards"

    var body: some View {
        VStack {
            
            Text("You can't touch this")
                .padding(25)

              Text("Break it down!")
                  .textSelection(.enabled)
            
//            Text("This is regular text.")
//                .padding()
//            Text("* This is **bold** text, this is *italic* text, and this is ***bold, italic*** text.")
//                .padding()
//            Text("~~A strikethrough example~~")
//            Text("`Monospaced works too`")
//                .padding()
//            Text("Visit Apple: [click here](https://apple.com)")
//                .padding()
            
//            Text("Card number")
//                .font(.headline)
//                .padding()
//
//            Text("1234 5678 9012 3456")
//                .privacySensitive()
//                .padding()
//
//            if redactionReasons.contains(.privacy) {
//                Text("[HIDDEN]")
//                    .padding()
//            } else {
//                Text("1234 5678 9012 3456")
//                    .padding()
//            }
            
//            Text("This is placeholder text")
//                .font(.title)
//                .redacted(reason: .placeholder)
//                .padding()
//
//            VStack {
//                Text("This is placeholder text")
//                Text("And so is this")
//            }
//            .font(.title)
//            .redacted(reason: .placeholder)
//            .padding()
//
//            if redactionReasons == .placeholder {
//                Text("Loading…")
//                    .padding()
//            } else {
//                Text(bio)
//                    .font(.title3)
//                    .redacted(reason: redactionReasons)
//                    .padding()
//            }
            
//            Text("ffi")
//                .font(.custom("AmericanTypewriter", size: 72))
//                .kerning(amount)
//            Text("ffi")
//                .font(.custom("AmericanTypewriter", size: 72))
//                .tracking(amount)
//
//            Slider(value: $amount, in: 0...100) {
//                Text("Adjust the amount of spacing")
//            }
        }
        .padding()
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
