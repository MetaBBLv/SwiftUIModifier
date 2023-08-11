//
//  FFDatePickerOrRead.swift
//  FFModifier
//
//  Created by BBLv on 2023/7/25.
//
//  如何创建DatePicker并读取值
//  SwiftUI的DatePicker类似于UIDatePicker，并带有多种选项来控制其样式与工作方式，与所有存储值的空间一样，它需要绑定到应用程序中的某中状态。

import SwiftUI

struct FFDatePickerOrRead: View {
    @State private var birthDate = Date.now
    @State private var date = Date.now
    
    var body: some View {
        //例如，创建一个绑定到birthDate的datePicker，通过选择日期，然后显示设置的datePicker值
        /**
         displayedComponents 是一个 DatePickerComponents 类型，它是一个包含 Set 的结构体。您可以在其中包含以下日期组件的选项：

         DatePickerComponents.hourAndMinute: 这个选项会在日期选择器中只显示小时和分钟组件。如果您选择了此选项，日期选择器将只显示用户选择小时和分钟的滚动选择器。其他日期组件，如日期和年份，将被隐藏。

         DatePickerComponents.date: 这个选项会在日期选择器中显示日期、月份和年份组件。选择了此选项后，日期选择器将显示用户选择日期、月份和年份的滚动选择器。

         */
        VStack {
            DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                Text("Select a date")
            }
            
            Text("Date is \(birthDate.formatted(date: .long, time: .omitted))")
        }
        .padding()
        
        Divider()
        //从iOS14开始，使用GraphicalDatePickerStyle获得更高级的日期选择其
        VStack {
            Text("Enter your birthday")
                .font(.largeTitle)
            DatePicker("Enter your birthday", selection: $date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(maxHeight: 400)
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    FFDatePickerOrRead()
}
