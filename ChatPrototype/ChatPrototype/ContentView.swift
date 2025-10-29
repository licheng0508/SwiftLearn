//
//  ContentView.swift
//  ChatPrototype
//
//  Created by stnts on 2025/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        FlipClockCard(theme: .classic)
        FlipClockCard(theme: .light)
    }
}

#Preview {
    ContentView()
}
