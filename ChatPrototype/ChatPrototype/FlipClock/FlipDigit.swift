//
//  FlipDigit.swift
//  ChatPrototype
//
//  Created by stnts on 2025/9/28.
//

import SwiftUI

struct FlipDigit: View {
    let value: Int
    let theme: FlipClockTheme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: theme.cornerRadius)
                .fill(theme.backgroundColor)
                .shadow(color: theme.shadow, radius: 4, x: 2, y: 2)
                .overlay(
                    RoundedRectangle(cornerRadius: theme.cornerRadius)
                        .stroke(theme.highlight, lineWidth: 1)
                )
            
            Text("\(value)")
                .font(theme.font)
                .foregroundColor(theme.foregroundColor)
                .shadow(color: theme.shadow, radius: 2, x: 1, y: 1)
        }
    }
}
