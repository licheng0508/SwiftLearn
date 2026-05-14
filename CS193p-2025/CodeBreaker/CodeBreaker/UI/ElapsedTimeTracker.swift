//
//  ElapsedTimeTracker.swift
//  CodeBreaker
//
//  Created by stnts on 2026/5/14.
//

import SwiftUI
import SwiftData

extension View {
    func trackElapsedTime(in game: CodeBreaker) -> some View {
        self.modifier(ElapsedTimeTracker(game: game))
    }
}

struct ElapsedTimeTracker: ViewModifier {
    @Environment(\.modelContext) var modelContext
    @Environment(\.scenePhase) var scenePhase
    let game: CodeBreaker
    
    var modelContextWillSavePiblisher: NotificationCenter.Publisher {
        NotificationCenter.default.publisher(
            for: ModelContext.willSave,
            object: modelContext
        )
    }
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                game.startTimer()
            }
            .onDisappear {
                game.pauseTimer()
            }
            .onChange(of: game) { oldGame, newGame in
                oldGame.pauseTimer()
                newGame.startTimer()
            }
            .onChange(of: scenePhase) {
                switch scenePhase {
                case .active: game.startTimer()
                case .background: game.pauseTimer()
                default: break
                }
            }
            .onReceive(modelContextWillSavePiblisher) { _ in
                game.updateElapsedTime()
                print("update elapsed time to \(game.elapsedTime)")
            }
    }
}
