//
//  PegView.swift
//  CodeBreaker
//
//  Created by stnts on 2025/12/23.
//

import SwiftUI

struct PegView: View {
    
    let peg: Peg
    
    let pegShape = Diamond()
    
    var body: some View {
        pegShape
            .contentShape(pegShape)
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(Color(hex: peg) ?? .clear)
    }
}

#Preview {
    PegView(peg: Color.blue.hex)
        .padding()
}
