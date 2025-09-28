//
//  FlipClockCard.swift
//  ChatPrototype
//
//  Created by stnts on 2025/9/28.
//

import SwiftUI

struct FlipClockCard: View {
    var body: some View {
        
        FlipClock(theme: .classic, is24Hour: true)
    }
}

#Preview {
    FlipClockCard()
}
