//
//  ElapsedTime.swift
//  CodeBreaker
//
//  Created by stnts on 2025/12/25.
//

import SwiftUI

struct ElapsedTime: View {
    
    let startTime: Date
    let endTime: Date?
    
    var body: some View {
        if let endTime = endTime {
            Text(endTime, format: .offset(to: startTime, allowedFields: [.minute, .second]))
        } else {
            Text(TimeDataSource<Date>.currentDate, format: .offset(to: startTime, allowedFields: [.minute, .second]))
        }
    }
}
