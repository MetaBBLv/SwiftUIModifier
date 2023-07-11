//
//  FFTextDataFormat.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/10.
//
// SwiftUI 的文本试图附带两种特定的日期格式化函数，以使日期在屏幕上看起来更好：一种是用来处理耽搁日期，另一种用来处理日期范围


import SwiftUI

struct FFTextDataFormat: View {
    var body: some View {
        List {
            Section {
                // 日期范围实际上非常简单，因为你只需要提供一个封闭的时间范围，他将确保根据用户的区域设置正确的格式：
                Text(Date.now...Date.now.addingTimeInterval(600))
            }
            
            Section {
                // 使用单个日期时，你可以提供一个style参数来确定日期格式。
                // 只显示日期
                Text(Date.now.addingTimeInterval(600), style: .date)
                // 只显示时间
                Text(Date.now.addingTimeInterval(600), style: .time)
                // 显示距离现在的相对时间，自动更新(倒计时)
                Text(Date.now.addingTimeInterval(600), style: .relative)
                // 创建定时器样式，自动更新
                Text(Date.now.addingTimeInterval(600), style: .timer)
            }
        }
    }
}

#Preview {
    FFTextDataFormat()
}
