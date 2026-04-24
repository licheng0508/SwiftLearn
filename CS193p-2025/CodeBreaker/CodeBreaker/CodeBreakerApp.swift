//
//  CodeBreakerApp.swift
//  CodeBreaker
//
//  Created by stnts on 2025/12/16.
//

import SwiftUI
import SwiftData

@main
struct CodeBreakerApp: App {
    var body: some Scene {
        WindowGroup {
            GameChooser()
                .modelContainer(for: CodeBreaker.self)
        }
    }
}
