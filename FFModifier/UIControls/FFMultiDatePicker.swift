//
//  FFMultiDatePicker.swift
//  FFModifier
//
//  Created by 小B同学 on 2023/7/25.
//
//  如何让用户选择多个日期
//  SwiftUI的MultiDatePicker显示日历视图，用户能同事选择各种日期，无论是从任何可能的日期还是从你选择的日期范围

import SwiftUI

struct FFMultiDatePicker: View {
    @Environment(\.calendar) var calendar
    @State var dates: Set<DateComponents> = []

    var body: some View {
        List {
            Section {
                MultiDatePicker("Select your preferred dates", selection: $dates)
            }
            
            Section {
                //在环境中读取日历，并转换为数据
                MultiDatePicker("Select your preferred dates", selection: $dates)
                Text(summary)
            }
            
            Section {
                //添加选取时间限制，在今天开始往后的时间
                MultiDatePicker("Select your preferred dates", selection: $dates, in: Date.now...)
                Text(summary)
            }
        }
    }
    
    var summary: String {
        dates.compactMap { components in
            calendar.date(from: components)?.formatted(date:.long, time:.omitted)
        }.formatted()
    }
}

#Preview {
    FFMultiDatePicker()
}
