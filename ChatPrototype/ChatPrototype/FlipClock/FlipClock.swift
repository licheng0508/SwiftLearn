//
//  FlipClock.swift
//  ChatPrototype
//
//  Created by stnts on 2025/9/28.
//

import SwiftUI

struct FlipClock: View {
    
    @State private var date = Date()
    @State private var showColon = true
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let theme: FlipClockTheme
    let is24Hour: Bool
    let digitWidth: CGFloat
    let digitHeight: CGFloat
    
    public init(theme: FlipClockTheme = .classic,
                is24Hour: Bool = true,
                digitWidth: CGFloat = 80,
                digitHeight: CGFloat = 100) {
        self.theme = theme
        self.is24Hour = is24Hour
        self.digitWidth = digitWidth
        self.digitHeight = digitHeight
    }
    
    private var calendar: Calendar { Calendar.current }
    
    private var hour: Int {
        let h = calendar.component(.hour, from: date)
        return is24Hour ? h : (h % 12 == 0 ? 12 : h % 12)
    }
    private var minute: Int {
        calendar.component(.minute, from: date)
    }
    
    private var second: Int {
        calendar.component(.second, from: date)
    }
    
    public var body: some View {
        HStack(spacing: 8) {
            digitPair(for: hour)
            colon
            digitPair(for: minute, showSecondsInOnes: true)
        }
        .onReceive(timer) { newDate in
            let oldSecond = calendar.component(.second, from: date)
            let newSecond = calendar.component(.second, from: newDate)
            
            date = newDate
            
            // 每秒闪烁冒号
            if newSecond != oldSecond {
                withAnimation(.easeInOut(duration: 0.4)) {
                    showColon.toggle()
                }
            }
        }
    }
    
    @ViewBuilder
    private func digitPair(for value: Int, showSecondsInOnes: Bool = false) -> some View {
        let tens = value / 10
        let ones = value % 10
        
        HStack(spacing: 6) {
            FlipDigit(value: tens, theme: theme)
                .frame(width: digitWidth, height: digitHeight)
            
            FlipDigit(
                value: ones,
                theme: theme,
                isMinuteOnes: showSecondsInOnes,
                currentSecond: showSecondsInOnes ? second : 0
            )
            .frame(width: digitWidth, height: digitHeight)
        }
    }
    
    private var colon: some View {
        Text(":")
            .font(theme.font)
            .foregroundColor(showColon ? theme.foregroundColor : theme.foregroundColor.opacity(0.6))
            .frame(width: 36)
    }
}

#Preview {
    FlipClock(theme: .classic, is24Hour: true)
    FlipClock(theme: .light, is24Hour: true)
}
