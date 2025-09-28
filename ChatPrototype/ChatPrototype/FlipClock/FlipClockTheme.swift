//
//  FlipClockTheme.swift
//  ChatPrototype
//
//  Created by stnts on 2025/9/28.
//

import SwiftUI

public struct FlipClockTheme {
    
    public var backgroundColor: Color
    public var foregroundColor: Color
    public var font: Font
    public var cornerRadius: CGFloat
    public var shadow: Color
    public var highlight: Color
    public var dayFont: Font
    
    public static let classic = FlipClockTheme(
        backgroundColor: .black,
        foregroundColor: .green,
        font: .system(size: 60, weight: .bold, design: .monospaced),
        cornerRadius: 8,
        shadow: .black.opacity(0.6),
        highlight: .white.opacity(0.2),
        dayFont: .system(size: 16, weight: .bold, design: .monospaced)
    )
    
    public static let light = FlipClockTheme(
        backgroundColor: .white,
        foregroundColor: .black,
        font: .system(size: 60, weight: .bold, design: .monospaced),
        cornerRadius: 8,
        shadow: .gray.opacity(0.3),
        highlight: .white.opacity(0.6),
        dayFont: .system(size: 16, weight: .bold, design: .monospaced)
    )
}
