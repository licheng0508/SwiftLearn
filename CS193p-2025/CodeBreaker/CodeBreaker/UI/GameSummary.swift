//
//  GameSummary.swift
//  CodeBreaker
//
//  Created by stnts on 2025/12/26.
//

import SwiftUI

struct GameSummary: View {
    
    let game: CodeBreaker
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(game.name).font(.title)
            PegChooser(choices: game.pegChoices).frame(maxHeight: 50)
            Text("^[\(game.attempts.count) attempt](inflect: true)")
        }
    }
}

#Preview {
    List{
        GameSummary(game: CodeBreaker(name: "Preview", pegChoices: [.red, .blue, .green]))
    }
    
    List{
        GameSummary(game: CodeBreaker(name: "Preview", pegChoices: [.red, .blue, .green]))
    }
    .listStyle(.plain)
}
