//
//  PolygonShape.swift
//  CodeBreaker
//
//  Created by stnts on 2026/5/15.
//


import SwiftUI

struct PolygonShape: Shape {
    
    /// 边数
    var sides: Int
    
    /// 旋转角度（默认顶部朝上）
    var rotation: Angle = .degrees(-90)
    
    func path(in rect: CGRect) -> Path {
        
        guard sides >= 3 else {
            return Path()
        }
        
        let center = CGPoint(
            x: rect.midX,
            y: rect.midY
        )
        
        let radius = min(rect.width, rect.height) / 2
        
        let angleStep = CGFloat.pi * 2 / CGFloat(sides)
        
        let startAngle = CGFloat(rotation.radians)
        
        var path = Path()
        
        for index in 0..<sides {
            
            let angle = startAngle + angleStep * CGFloat(index)
            
            let point = CGPoint(
                x: center.x + cos(angle) * radius,
                y: center.y + sin(angle) * radius
            )
            
            if index == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        
        path.closeSubpath()
        
        return path
    }
}
