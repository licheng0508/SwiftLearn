//
//  GameEditor.swift
//  CodeBreaker
//
//  Created by stnts on 2025/12/30.
//

import SwiftUI

struct GameEditor: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Bindable var game: CodeBreaker
    
    let onChosse: () -> Void
    
    @State private var showInvalidGameAlert = false
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Name") {
                    TextField("Name", text: $game.name)
                        .autocapitalization(.words)
                        .autocorrectionDisabled(false)
                        .onSubmit {
                            done()
                        }
                }
                Section("Page") {
                    PegChoicesChooser(pegChoices: $game.pegChoices)
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        done()
                    }
                    .alert("Invalid Game", isPresented: $showInvalidGameAlert) {
                        Button("OK") {
                            showInvalidGameAlert = false
                        }
                    } message: {
                        Text("A game must have a name and more than one unique peg.")
                    }
                }
            }
        }
    }
    
    func done() {
        if game.isValid {
            onChosse()
            dismiss()
        }else{
            showInvalidGameAlert = true
        }
    }
}

extension CodeBreaker {
    var isValid: Bool {
        !name.isEmpty && Set(pegChoices).count >= 2
    }
}

#Preview {
    @Previewable var game = CodeBreaker(name: "Preview", pegChoices: [.orange, .purple])
    GameEditor(game: game) {
        print("game name changed to \(game.name)")
        print("game pegs changed to \(game.pegChoices)")
    }
}
