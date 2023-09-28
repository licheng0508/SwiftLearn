//
//  DateView.swift
//  Demo
//
//  Created by stnts on 2023/8/31.
//

import SwiftUI

struct DateView: View {
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    let dueDate = Date()

    var body: some View {
        
        VStack {
            Text("Task due date: \(dueDate, formatter: Self.taskDateFormat)")
                .padding()
            // 只显示日期
            Text(Date().addingTimeInterval(600), style: .date)
                .padding()
            // 只显示时间
            Text(Date().addingTimeInterval(600), style: .time)
                .padding()
            // 显示从现在开始的相对距离，并自动更新
            Text(Date().addingTimeInterval(600), style: .relative)
                .padding()
            // 制作计时器样式，自动更新
            Text(Date().addingTimeInterval(600), style: .timer)
                .padding()
        }.padding()
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
