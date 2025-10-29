//
//  FlipClockCard.swift
//  ChatPrototype
//
//  Created by stnts on 2025/9/28.
//

import SwiftUI

struct FlipClockCard: View {
    
    let theme: FlipClockTheme
    
    var body: some View {
        FlipClock(theme: theme, is24Hour: true)
    }
}

#Preview {
    FlipClockCard(theme: .classic)
}
