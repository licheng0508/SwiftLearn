//
//  PegChooser.swift
//  CodeBreaker
//
//  Created by stnts on 2025/12/23.
//

import SwiftUI

struct PegChooser: View {
    
    let choices: [Peg]
    
    var onChoose: ((Peg) -> Void)?
    
    var body: some View {
        HStack {
            ForEach(choices, id: \.self) { peg in
                Button {
                    onChoose?(peg)
                } label: {
                    PegView(peg: peg)
                }
            }
        }
    }
}

#Preview {
    PegChooser(choices: [.red, .blue, .green, .yellow]) { peg in
        print("chose \(peg)")
    }
    .padding()
}
