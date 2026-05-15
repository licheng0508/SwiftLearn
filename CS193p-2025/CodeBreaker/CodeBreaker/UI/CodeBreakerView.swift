//
//  ContentView.swift
//  CodeBreaker
//
//  Created by stnts on 2025/12/16.
//

import SwiftUI

struct CodeBreakerView: View {
    
    @Environment(\.sceneFrame) var sceneFrame
    
    // MARK: Data
    let game: CodeBreaker
    
    @State private var selection: Int = 0
    @State private var restarting = false
    @State private var hideMostRecentMarkers = false
    
    var body: some View {
        VStack {
            CodeView(code: game.masterCode)
            ScrollView {
                if !game.isOver {
                    CodeView(code: game.guess, selection: $selection) {
                        Button("Guess", action: guess).flexibleSystemFont()
                    }
                    .animation(nil, value: game.attempts.count)
                    .opacity(restarting ? 0 : 1)
                }
                ForEach(game.attempts, id: \.pegs) { attempt in
                    CodeView(code: attempt) {
                        let showMarkers = !hideMostRecentMarkers || attempt.pegs != game.attempts.first?.pegs
                        if showMarkers, let matches = attempt.matches {
                            MatchMarkers(matches: matches)
                        }
                    }
                    .transition(.attempt(game.isOver))
                }
            }
            
            GeometryReader { geometry in
                if !game.isOver {
                    let offset = sceneFrame.maxY - geometry.frame(in: .global).minY
                    PegChooser(choices: game.pegChoices, onChoose: changePegAtSelection)
                        .transition(.offset(x: 0, y: offset))
                }
            }
            .aspectRatio(CGFloat(game.pegChoices.count), contentMode: .fit)
            .frame(maxHeight: 90)
        }
        .highPriorityGesture(pegChoosingDial)
        .trackElapsedTime(in: game)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Restart", systemImage: "arrow.circlepath", action: restart)
            }
            ToolbarItem {
                ElapsedTime(startTime: game.startTime, endTime: game.endTime, elapsedTime: game.elapsedTime)
                    .monospaced()
                    .lineLimit(1)
            }
        }
        .padding()
    }
    
    var pegChoosingDial: some Gesture {
        RotateGesture()
            .onChanged { value in
                let pegChoiceIndex = Int(abs(value.rotation.degrees.valid) / 45) % game.pegChoices.count
                game.guess.pegs[selection] = game.pegChoices[pegChoiceIndex]
            }
    }
    
    func changePegAtSelection(to peg: Peg) {
        game.setGuessPeg(peg, at: selection)
        selection = (selection + 1) % game.masterCode.pegs.count
    }
    
    func restart() {
        withAnimation(.restart) {
            restarting = game.isOver
            game.restart()
            selection = 0
        }completion: {
            withAnimation(.restart) {
                restarting = false
            }
        }
    }
    
    func guess() {
        withAnimation(.guess) {
            game.attemptGuess()
            selection = 0
            hideMostRecentMarkers = true
        } completion: {
            withAnimation(.guess) {
                hideMostRecentMarkers = false
            }
        }
    }
}

extension CodeBreaker {
    convenience init(name: String = "Code Breaker", pegChoices: [Color]) {
        self.init(name: name, pegChoices: pegChoices.map(\.hex))
    }
    var pegColorChoices: [Color] {
        get { pegChoices.map { Color(hex: $0) ?? .clear }}
        set { pegChoices = newValue.map(\.hex) }
    }
}

#Preview(traits: .swiftData) {
    @Previewable @State var game = CodeBreaker(name: "Preview", pegChoices: [.red, .blue, .green, .yellow])
    NavigationStack {
        CodeBreakerView(game: game)
    }
}
