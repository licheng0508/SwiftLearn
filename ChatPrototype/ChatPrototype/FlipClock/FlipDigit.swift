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
    let isMinuteOnes: Bool
    let currentSecond: Int
    
    init(value: Int,
         theme: FlipClockTheme,
         isMinuteOnes: Bool = false,
         currentSecond: Int = 0) {
        self.value = value
        self.theme = theme
        self.isMinuteOnes = isMinuteOnes
        self.currentSecond = currentSecond
    }
    
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
                .overlay(
                    // 中间横线
                    Rectangle()
                        .fill(theme.backgroundColor) // 跟背景颜色一致
                        .frame(height: 2)             // 横线粗细
                        .offset(y: 0)                 // 居中
                )
            
            if isMinuteOnes {
                Text(String(format: "%02d", currentSecond))
                    .font(.system(size: 14, weight: .bold, design: .monospaced))
                    .foregroundColor(theme.foregroundColor.opacity(0.9))
                    .padding(6)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            }
        }
    }
}

#Preview {
    FlipDigit(
        value: 10,
        theme: .classic,
        isMinuteOnes: true,
        currentSecond: 10
    )
}

